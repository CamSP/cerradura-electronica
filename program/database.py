import urequests as requests
import json
import gc
import time
from machine import Pin
import _thread


class database: 
    def __init__(self, id, name, user, config = True):
        self.id = id
        self.URL = "https://firestore.googleapis.com/v1beta1/projects/cerradura-electronica/databases/(default)/documents/cerraduras/" + self.id  
        self.headers = {"key": "AIzaSyAQsLEaa6LwdV64HHmc3O-3DK9WYzwHCnM"}
        self.cerradura = Pin(2, Pin.OUT)
        self.cerradura.value(True)
        if config==False:
            self.createDB(user, name)
        else: 
            _thread.start_new_thread(self.listener, ("test", 2))

    def listener(self, *args):
        while True:
            data = requests.get(self.URL+"/status/status", headers=self.headers).json()["fields"]["status"]['booleanValue']
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


    def createDB(self, user, name):
        self.body = {
            "fields" : {
                "_id" : {
                        "stringValue" : str(self.id)
                    },
                "name":{
                    "stringValue" : name
                }
            }
        }
        requests.patch(self.URL, data=json.dumps(self.body), headers=self.headers)
        gc.collect()
        self.body = {
            "fields":{
                "status":{
                    "booleanValue": True
                    } 
                }
            }
        requests.patch(self.URL+ "/status/status", data=json.dumps(self.body), headers=self.headers)
        gc.collect()  
        self.body = {
            "fields":{
                "users":{
                    "arrayValue": {
                            "values":[
                                {
                                    "stringValue": user
                                }
                            ]
                        }
                    } 
                }
            }
        requests.patch(self.URL+ "/users/users", data=json.dumps(self.body), headers=self.headers)
        gc.collect() 

 