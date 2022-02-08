from machine import UART
from machine import Pin

class as608:
    def __init__(self):
        
        uart = UART(1, 57600)
        uart.init(57600, bits=8, parity=None, stop=1, tx=9, rx=10)
        data = [0xEF01, 0x01, 0x03, 0xf, 0x0013]
        uart.write(data)
        print(uart.read())

