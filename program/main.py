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

# Se activa la recolección de basura automática
gc.enable()

# Inicialización de los LEDS
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
    # se crea el objeto huella
    f = PyFingerprint(sensorSerial)
    # se revisa la contraseña del sensor
    if ( f.verifyPassword() == False ):
        raise ValueError('The given fingerprint sensor password is wrong!')

# En caso de que no se inicialice el sensor, se reinicia el sistema
except Exception as e:
    print(e)
    reset()

# Función que hace un blink de un LED determinado
def blinkLed(led):
    led.duty(d)
    time.sleep(0.3)
    led.duty(0)
    time.sleep(0.3)
    
# Función que mantiene el LED de encendido y de WiFi parpadeando
def blinkOn():
    if cfg.isConnected():
        ledON.duty(d)
        ledWIFI.duty(d)
        time.sleep(1)
        ledON.duty(0)
        ledWIFI.duty(0)
        time.sleep(1)

    else:
        ledWIFI.duty(0)
        ledON.duty(d)
        time.sleep(1)
        ledON.duty(0)
        time.sleep(1)

# Función que se encarga de abrir y cerrar la cerradura en un lapso de 3 segundos
def openLock():
    cerradura.value(False)
    ledOpen.duty(d)
    time.sleep(3)
    cerradura.value(True)
    ledOpen.duty(0)

# Se inicializa la configuración del sistema
cfg = config()

# Recoge la basura en la RAM
gc.collect()

# Inicia un hilo que mantiene la función blinkOn ejecutandose continuamente
_thread.start_new_thread(blinkOn, ())

# Lee el json e inicializa la base de datos
with open('cfg.json', "r") as js:
    cfgJSON = json.load(js)
db = database()

# Recoge la basura de la RAM
gc.collect()

# Inicializa el pin de la cerradura
cerradura = Pin(2, Pin.OUT)
cerradura.value(True)

# Inicializa el RFID
rdr = RFID()

# Se crea la variable registering
registering = False


while True:
    # Busca constantemente RFID's proximos al sensor
    card_value = rdr.getCard()
    
    # Si el RFID cercano es la tarjeta "secreta", entra en modo de configuración
    if card_value == rdr.getSecretCard():
        print("Modo configuración")
        registering = True
        ledConfig.duty(d)
        continue

    # Si el modo de configuración esta activado
    if registering:
        while True:
            # Busca una nueva tarjeta
            card_value = rdr.getCard()
            # Si es diferente a la tarjeta secreta, registra el nuevo valor en el archivo uuidCard.txt
            if rdr.getSecretCard() != card_value and card_value != '':
                rdr.write_to_file(card_value)
                # Desactiva el modo de configuración
                registering = False
                print("guardado")
                blinkLed(ledSuccess)
                break     

            # Si detecta una huella dactilar, la almacena en la memoria del sensor
            if f.readImage() == True:
                f.createTemplate()
                f.storeTemplate()
                print("Dedo guardado")
                # Desactiva el modo de configuración
                registering = False
                gc.collect()
                break
                
    else:
        # Si no es la tarjeta de configuración revisa los valores guardados en uuidCard.txt y si encuentra coincidencias abre la cerradura
        if card_value != '':
            if rdr.check_card_code(code_from_card=card_value):
                openLock()
            else:
                # De lo contrario enciende un LED rojo
                blinkLed(ledError)

        # Si lee una huella dactilar intenta buscarla en las plantillas guardadas
        if f.readImage() == True:
            try:
                f.convertImage()
                # Si encuentra una coincidencia, abre la cerradura
                if f.searchTemplate()[0] != -1:
                    openLock()
                else:
                    print("Desconocido")
            except:
                print("Fallo")
    # Recoge la basura de la RAM
    gc.collect()