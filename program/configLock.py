import network
from microWebSrv import MicroWebSrv
import time
import json
import gc
import uuid
import machine



class config:

    def __init__(self):
        # Se inicializa el wifi en modo estación y en modo de access point
        self.sta = network.WLAN(network.STA_IF) 
        self.ap = network.WLAN(network.AP_IF)
        # Lee la configuración del json
        with open('cfg.json', "r") as f:
            self.cfg = json.load(f)
        
        print(self.cfg)

        # Si la cerradura no tiene un UUID asignado, se crea uno
        if self.cfg["uuid"] == "":
            self.cfg["uuid"] = uuid.uuid4().hex
            with open('cfg.json', "w") as f:
                f.write(json.dumps(self.cfg))

        print(self.cfg["config"])

        # Si la cerradura esta configurada, se conecta al wifi
        if self.cfg["config"] == True:
            self.connect(self.cfg["ssid"], self.cfg["password"])
        # Si no esta configurada, se buscan las redes cercanas y se ejecuta el web server
        else:
            print("run server")
            self.ssids = self.scan()
            self.runServer()

    # Esta función ejecuta el web server
    def runServer(self):
        # Se coloca el wifi en modo access point
        self.sta.active(False)
        self.ap.active(True)
        self.ap.config(essid="Cerradura Electrónica")
        #se establecen los route handlers
        routeHandlers = [("/data", "POST", self._httpHandlerDataPost), ("/data", "GET", self._httpHandlerSSIDGet)]
        self.svr = MicroWebSrv(routeHandlers=routeHandlers, webPath='/www/')
        print("runing server")
        #Se inicializa el web server
        self.svr.Start(threaded=False)


    # Detiene el web server
    def stopServer(self):
        print("Stop!")
        self.svr.Stop()
        gc.collect()
        return

    # Busca las redes wifi cercanas
    def scan(self):
        self.sta.active(True)
        ssids = self.sta.scan()
        return ssids

    #Se conecta al wifi a partir de un ssid y una contraseña dada
    def connect(self, ssid, password):
        
        self.ap.active(False)
        self.sta.active(True)
        self.sta.connect(ssid, password)
        start_time = time.time()
        print("Connecting...")
        # Si no se conecta en 10 segundos, se retorna False
        while self.sta.isconnected() == False: 
            time_delta = time.time() - start_time
            if time_delta>=10:
                print("Fallo!")
                return False
            pass

        
        # Si se logar, se retorna True
        return True

    # http handler que se encarga de envíar los SSIDs al webserver, que posteriormente seran utilizados en un script de JS
    def _httpHandlerSSIDGet(self, httpClient, httpResponse):
        try:
            data = []
            for i in self.ssids:
                data.append(i[0].decode("utf-8"))
                data = list(dict.fromkeys(data))
        except:
            print("Fallo")


        httpResponse.WriteResponseOk(
            headers = ({'Cache-Control': 'no-cache'}),
            contentType = 'text/event-stream',
            contentCharset = 'UTF-8',
            content = 'data: {0}\n\n'.format(data) 
        )

    # http handler que recibe las respuestas del formulario 
    def _httpHandlerDataPost(self, httpClient, httpResponse):
        content = httpClient.ReadRequestContent()
        # Convierte la request en un JSON
        data = json.loads(content)
        # Obtiene los valores en cada posición del JSON y las convierte en variables de entorno
        email, name, password, ssid = [data[k] for k in sorted(data.keys())]
        print(email, ssid, name, password)
        self.cfg["name"] = name
        self.cfg["users"] = email
        # Detiene el webserver
        self.stopServer() 
        # Si se conecta el wifi, se completa la configuración y se guarda en el archivo JSON
        if self.connect(ssid, password) == True:
            self.cfg["ssid"] = ssid
            self.cfg["password"] = password
            self.cfg["config"] = True
    
            with open('cfg.json', "w") as f:
                f.write(json.dumps(self.cfg))
        
        # Reinicia el sistema
        machine.reset()  
        httpResponse.WriteResponseJSONOk()

        

    def reset(self):
        self.cfg["ssid"] = ""
        self.cfg["password"] = ""
        self.cfg["name"] = ""
        self.cfg["users"] = ""
        self.cfg["config"] = False

        with open('cfg.json', "w") as f:
                f.write(json.dumps(self.cfg))

    def isConnected(self):
        return self.sta.isconnected()