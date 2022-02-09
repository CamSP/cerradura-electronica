import urequests as requests
import json
import gc
import time
from machine import Pin
import _thread


class database: 
    def __init__(self, id, name, user, config = True):
        self.URL = "https://firestore.googleapis.com/v1beta1/projects/cerradura-electronica/databases/(default)/documents/cerraduras/" + id  
        self.headers = {"key": "AIzaSyAQsLEaa6LwdV64HHmc3O-3DK9WYzwHCnM"}
        self.cerradura = Pin(2, Pin.OUT)
        self.cerradura.value(True)
        if config==False:
            self.createDB(user, name, id)
        else: 
            _thread.start_new_thread(self.listener, ())

    def listener(self):
        while True:
            try:
                data = requests.get(self.URL+"/status/status", headers=self.headers).json()["fields"]["status"]['booleanValue']
                print(data)
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


    def createDB(self, user, name, id):

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
        print("db")
        time.sleep(1)

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
        print("users")
        time.sleep(1)
        
        self.body = {
            "fields" : {
                "_id" : {
                        "stringValue" : id
                    },
                "name":{
                    "stringValue" : name
                }
            }
        }
        requests.patch(self.URL, data=json.dumps(self.body), headers=self.headers)
        gc.collect() 

 