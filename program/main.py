#Librerias
from machine import Pin,PWM
from machine import Pin
import network
import time
from config import config
from RFID import RFID
import _thread

## Encendido de Leds
f=1000 
d=300 

ledON=PWM(Pin(27))
ledOpen=PWM(Pin(25))
ledSuccess=PWM(Pin(12))
ledError=PWM(Pin(14))
ledConfig=PWM(Pin(13))
ledWIFI=PWM(Pin(26))

ledON.freq(f)
ledOpen.freq(f)
ledSuccess.freq(f)
ledError.freq(f)
ledConfig.freq(f)
ledWIFI.freq(f)

ledON.duty(d)
ledOpen.duty(0)
ledSuccess.duty(0)
ledError.duty(0)
ledConfig.duty(0)
ledWIFI.duty(0)


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


cfg = config()
_thread.start_new_thread(blinkOn, ())
#cfg.reset()


cerradura = Pin(2, Pin.OUT)
cerradura.value(True)
rdr = RFID()
registering = False
while True:

    #blinkOn(cfg.isConnected())
    card_value = rdr.getCard()
    if card_value == rdr.getSecretCard():
        print("match")
        registering = True
        ledConfig.duty(d)
        time.sleep(1)
        ledConfig.duty(0)
        time.sleep(1)
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
    else:
        if card_value != '':
            if rdr.check_card_code(code_from_card=card_value):
                cerradura.value(True)
                ledOpen.duty(d)
                time.sleep(3)
                cerradura.value(False)
                ledOpen.duty(0)
            else:
                blinkLed(ledError)



                    
# from machine import Pin
# from machine import Timer
# import time
# import _thread
# import mfrc522
# from pyfingerprint import PyFingerprint
# from machine import UART

# sensorSerial = UART(1)
# # ESP32 (pins 12, 13)
# sensorSerial.init(57600, bits=8, parity=None, stop=1, rx=10, tx=9)
# # pyboard v1.1 (pins X9, X10)
# # sensorSerial.init(57600, bits=8, parity=None, stop=1)

# f = PyFingerprint(sensorSerial)
# print(f.readImage()) # should return True

    
    
    
    
    
    
    
