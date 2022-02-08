from machine import Pin,PWM
from time import sleep_ms

ledlock=PWM(Pin(13))
ledfinger=PWM(Pin(12))
ledrfid=PWM(Pin(14))
ledon=PWM(Pin(27))
ledoff=PWM(Pin(26))
led=PWM(Pin(25))
f=1000 # Frequency Hz until 40MHz
d=300 #%Duty /1024

led.freq(f)
ledlock.freq(f)
ledfinger.freq(f)
ledoff.freq(f)
ledon.freq(f)
ledrfid.freq(f)

led.duty(d)
ledlock.duty(d)
ledfinger.duty(d)
ledoff.duty(d)
ledon.duty(d)
ledrfid.duty(d)

sleep_ms(100)