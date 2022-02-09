#Librerias
import time
from pyfingerprint import PyFingerprint
from pyfingerprint import *
from machine import Pin, PWM, UART, reset
from database import database
from configLock import config
from RFID import RFID
import _thread
import json
import gc


gc.enable()
freq=1000 
d=300 

ledON=PWM(Pin(27))
ledOpen=PWM(Pin(25))
ledSuccess=PWM(Pin(12))
ledError=PWM(Pin(14))
ledConfig=PWM(Pin(13))
ledWIFI=PWM(Pin(26))

ledON.freq(freq)
ledOpen.freq(freq)
ledSuccess.freq(freq)
ledError.freq(freq)
ledConfig.freq(freq)
ledWIFI.freq(freq)

ledON.duty(d)
ledOpen.duty(0)
ledSuccess.duty(0)
ledError.duty(0)
ledConfig.duty(0)
ledWIFI.duty(0)

sensorSerial = UART(1)
sensorSerial.init(57600, bits=8, parity=None, stop=1, rx=10, tx=9)
try:
    # creo el objeto huella
    f = PyFingerprint(sensorSerial)
    f.clearDatabase()
    #se revisa la contraseña del sensor
    if ( f.verifyPassword() == False ):
        raise ValueError('The given fingerprint sensor password is wrong!')
#revisar si existe
except Exception as e:
    print(e)
    print("Error del sensor")
    #reset()

def blinkLed(led):
    d = 300
    led.duty(d)
    time.sleep(0.3)
    led.duty(0)
    time.sleep(0.3)
    led.duty(d)
    time.sleep(0.3)
    led.duty(0)
    
def blinkOn():
    if cfg.isConnected():
        ledON.duty(d)
        ledWIFI.duty(d)
        time.sleep(1)
        ledON.duty(0)
        ledWIFI.duty(0)
        time.sleep(1)
        ledON.duty(d)
        ledWIFI.duty(d)
        time.sleep(1)
        ledON.duty(0)
        ledWIFI.duty(0)
    else:
        ledWIFI.duty(0)
        ledON.duty(d)
        time.sleep(1)
        ledON.duty(0)
        time.sleep(1)
        ledON.duty(d)
        time.sleep(1)
        ledON.duty(0)

def openLock():
    cerradura.value(False)
    ledOpen.duty(d)
    time.sleep(3)
    cerradura.value(True)
    ledOpen.duty(0)

cfg = config()
gc.collect()
_thread.start_new_thread(blinkOn, ())
with open('cfg.json', "r") as js:
    cfgJSON = json.load(js)
    
db = database(cfgJSON["uuid"], cfgJSON["name"], cfgJSON["users"], config=cfgJSON["config"])
gc.collect()

cerradura = Pin(2, Pin.OUT)
cerradura.value(True)
rdr = RFID()
registering = False
while True:
    card_value = rdr.getCard()
    
    if card_value == rdr.getSecretCard():
        print("Modo configuración")
        registering = True
        ledConfig.duty(d)
        continue

    if registering:
        while True:
            card_value = rdr.getCard()
            if rdr.getSecretCard() != card_value and card_value != '':
                rdr.write_to_file(card_value)
                registering = False
                print("guardado")
                blinkLed(ledSuccess)
                break     

            if f.readImage() == True:
                f.createTemplate()
                f.storeTemplate()
                print("Dedo guardado")
                registering = False
                gc.collect()
                break
                
    else:
        if card_value != '':
            if rdr.check_card_code(code_from_card=card_value):
                openLock()
            else:
                blinkLed(ledError)


        if f.readImage() == True:
            try:
                f.convertImage()
                if f.searchTemplate()[0] != -1:
                    openLock()
                else:
                    print("Desconocido")
            except:
                print("Fallo")
    gc.collect()