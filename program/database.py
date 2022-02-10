import urequests as requests
import json
import gc
import time
from machine import Pin, reset
import _thread


class database: 
    def __init__(self):

        with open('cfg.json', "r") as f:
            self.cfg = json.load(f)
        # Se establece el URL y la APIKEY de la base de datos
        self.URL = "https://firestore.googleapis.com/v1beta1/projects/cerradura-electronica/databases/(default)/documents/cerraduras/" + self.cfg["ssid"] 
        self.headers = {"key": "AIzaSyAQsLEaa6LwdV64HHmc3O-3DK9WYzwHCnM"}

        # Se inicializa la cerradura
        self.cerradura = Pin(2, Pin.OUT)
        self.cerradura.value(True)  

        

        # si la cerradura no esta configurada, se crea un nuevo documento en la base de datos
        if self.cfg["dbConfig"]==True:
            self.createDB()
        # De lo contrario se crea un hilo con la función listener
        else: 
            _thread.start_new_thread(self.listener, ())

    # Se encarga de emular un WebSocket
    def listener(self):
        while True:
            try:
                # Se intenta conectar a la base de datos a un documento en especfico
                data = requests.get(self.URL+"/status/status", headers=self.headers).json()["fields"]["status"]['booleanValue']
                print(data)
                # Si Status esta en False, se abre la cerradura por 3 segundos, luego coloca nuevamente status en True
                if data == False:
                    print("Abrir")
                    self.cerradura.value(False)
                    time.sleep(3)
                    self.cerradura.value(True)
                    self.body = {
                    "fields":{
                        "status":{
                            "booleanValue": True
                            } 
                        }
                    }
                    requests.patch(self.URL+ "/status/status", data=json.dumps(self.body), headers=self.headers)
                    gc.collect()
            except:
                pass

    # Crea la base de datos
    def createDB(self):
        try:
            # Crea el documento con la información basica de la cerradura
            print("db")
            time.sleep(1)
            self.body = {
                "fields" : {
                    "_id" : {
                            "stringValue" : self.cfg["uuid"]
                        },
                    "name":{
                        "stringValue" : self.cfg["name"]
                    },
                    "users": {
                        "arrayValue":{
                            "values":[
                                {
                                    "stringValue": self.cfg["users"]
                                }
                            ]
                        }
                    }
                }
            }
            requests.patch(self.URL, data=json.dumps(self.body), headers=self.headers)
            gc.collect() 

            # Crea el sub-documento status
            # Se crea en un sub-documento para optimizar la ram del microcontrolador
            print("Status")
            self.body = {
                "fields":{
                    "status":{
                        "booleanValue": True
                        } 
                    }
                }
            print(json.dumps(self.body))
            requests.patch(self.URL+ "/status/status", data=json.dumps(self.body), headers=self.headers)
            gc.collect() 
            self.cfg["dbConfig"] = True
            with open('cfg.json', "w") as f:
                f.write(json.dumps(self.cfg))


        # Si se produce un error se reinicia el sistema
        except:
            return
            #reset()


 