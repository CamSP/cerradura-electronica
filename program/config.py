import network
from microWebSrv import MicroWebSrv
import time
import json
import gc
import uuid
from database import database
import machine
from sys import exit



class config:

    def __init__(self):
        self.sta = network.WLAN(network.STA_IF) 
        self.ap = network.WLAN(network.AP_IF)
        with open('cfg.json', "r") as f:
            self.cfg = json.load(f)
        
        print(self.cfg)

        if self.cfg["uuid"] == "":
            self.cfg["uuid"] = uuid.uuid4().hex
            with open('cfg.json', "w") as f:
                f.write(json.dumps(self.cfg))

        print(self.cfg["config"])

        if self.cfg["config"] == True:
            self.connect(self.cfg["ssid"], self.cfg["password"])
        else:
            print("run server")
            self.ssids = self.scan()
            self.runServer()

    def runServer(self):
        self.sta.active(False)
        self.ap.active(True)
        self.ap.config(essid="Cerradura Electrónica")
        routeHandlers = [("/data", "POST", self._httpHandlerDataPost), ("/data", "GET", self._httpHandlerSSIDGet)]
        self.svr = MicroWebSrv(routeHandlers=routeHandlers, webPath='/www/')
        print("runing server")
        self.svr.Start(threaded=False)


    def stopServer(self):
        print("Stop!")
        self.svr.Stop()
        gc.collect()
        return

    def scan(self):
        self.sta.active(True)
        ssids = self.sta.scan()
        return ssids

    def connect(self, ssid, password):
        
        self.ap.active(False)
        self.sta.active(True)
        self.sta.connect(ssid, password)
        start_time = time.time()
        print("Connecting...")
        while self.sta.isconnected() == False: 
            time_delta = time.time() - start_time
            if time_delta>=10:
                print("Fallo!")
                return False
            pass
        return True

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


    def _httpHandlerDataPost(self, httpClient, httpResponse):
        content = httpClient.ReadRequestContent()
        data = json.loads(content)
        email, name, password, ssid = [data[k] for k in sorted(data.keys())]
        print(email, ssid, name, password)
        self.cfg["name"] = name
        self.cfg["users"] = email
        self.stopServer() 
        if self.connect(ssid, password) == True:
            
            self.cfg["ssid"] = ssid
            self.cfg["password"] = password
            database(self.cfg["uuid"], self.cfg["name"], self.cfg["users"], config=self.cfg["config"])
            self.cfg["config"] = True
    
            with open('cfg.json', "w") as f:
                f.write(json.dumps(self.cfg))
        
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