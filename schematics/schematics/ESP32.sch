EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 2200 5300 0    50   ~ 0
TX/RX -> Programación\nTX2/RX2 -> Huella dactilar\nSPI -> RFID\n
Text HLabel 6000 5100 0    50   Input ~ 0
RX
Text HLabel 6000 5000 0    50   Input ~ 0
TX
Wire Wire Line
	3900 3600 3700 3600
Connection ~ 3900 3600
Wire Wire Line
	3700 3600 3700 3550
Wire Wire Line
	4100 3600 3900 3600
$Comp
L power:GND #PWR0101
U 1 1 619447A6
P 3900 3600
F 0 "#PWR0101" H 3900 3350 50  0001 C CNN
F 1 "GND" H 3905 3427 50  0000 C CNN
F 2 "" H 3900 3600 50  0001 C CNN
F 3 "" H 3900 3600 50  0001 C CNN
	1    3900 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 619447AC
P 4100 3400
F 0 "C1" H 4215 3446 50  0000 L CNN
F 1 "0.1 uF" H 4215 3355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 4138 3250 50  0001 C CNN
F 3 "~" H 4100 3400 50  0001 C CNN
F 4 "C271438" H 4100 3400 50  0001 C CNN "LCSC"
	1    4100 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 619447B2
P 3700 3400
F 0 "C2" H 3815 3446 50  0000 L CNN
F 1 "10 uF" H 3815 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3738 3250 50  0001 C CNN
F 3 "~" H 3700 3400 50  0001 C CNN
F 4 "C96446" H 3700 3400 50  0001 C CNN "LCSC"
	1    3700 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 619447C3
P 4750 4050
F 0 "#PWR0102" H 4750 3800 50  0001 C CNN
F 1 "GND" H 4755 3877 50  0000 C CNN
F 2 "" H 4750 4050 50  0001 C CNN
F 3 "" H 4750 4050 50  0001 C CNN
	1    4750 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 619447C9
P 4900 3800
F 0 "C3" H 5015 3846 50  0000 L CNN
F 1 "0.3 uF" H 5015 3755 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4938 3650 50  0001 C CNN
F 3 "~" H 4900 3800 50  0001 C CNN
	1    4900 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 619447CF
P 4900 3400
F 0 "R1" H 4970 3446 50  0000 L CNN
F 1 "10k" H 4970 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4830 3400 50  0001 C CNN
F 3 "~" H 4900 3400 50  0001 C CNN
F 4 "C17902" H 4900 3400 50  0001 C CNN "LCSC"
	1    4900 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61972CD2
P 5450 3050
F 0 "#PWR0103" H 5450 2800 50  0001 C CNN
F 1 "GND" V 5455 2922 50  0000 R CNN
F 2 "" H 5450 3050 50  0001 C CNN
F 3 "" H 5450 3050 50  0001 C CNN
	1    5450 3050
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Push RESET1
U 1 1 61944795
P 4600 3800
F 0 "RESET1" V 4646 3752 50  0000 R CNN
F 1 "SW_Push" V 4555 3752 50  0000 R CNN
F 2 "RC522:boton" H 4600 4000 50  0001 C CNN
F 3 "~" H 4600 4000 50  0001 C CNN
	1    4600 3800
	0    -1   -1   0   
$EndComp
NoConn ~ 6000 3800
NoConn ~ 6000 3700
NoConn ~ 6000 4200
NoConn ~ 6000 4100
Wire Wire Line
	4450 5750 4450 5650
Wire Wire Line
	4450 5350 4450 5300
$Comp
L power:GND #PWR?
U 1 1 61995CB3
P 4450 5750
AR Path="/61995CB3" Ref="#PWR?"  Part="1" 
AR Path="/618FDA94/61995CB3" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 4450 5500 50  0001 C CNN
F 1 "GND" H 4455 5577 50  0000 C CNN
F 2 "" H 4450 5750 50  0001 C CNN
F 3 "" H 4450 5750 50  0001 C CNN
	1    4450 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61995CB9
P 4450 5150
AR Path="/61995CB9" Ref="R?"  Part="1" 
AR Path="/618FDA94/61995CB9" Ref="R2"  Part="1" 
F 0 "R2" H 4520 5196 50  0000 L CNN
F 1 "100" H 4520 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4380 5150 50  0001 C CNN
F 3 "~" H 4450 5150 50  0001 C CNN
F 4 "C17408" H 4450 5150 50  0001 C CNN "LCSC"
	1    4450 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5750 4150 5650
Wire Wire Line
	4150 5350 4150 5300
$Comp
L power:GND #PWR?
U 1 1 619B0516
P 4150 5750
AR Path="/619B0516" Ref="#PWR?"  Part="1" 
AR Path="/618FDA94/619B0516" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 4150 5500 50  0001 C CNN
F 1 "GND" H 4155 5577 50  0000 C CNN
F 2 "" H 4150 5750 50  0001 C CNN
F 3 "" H 4150 5750 50  0001 C CNN
	1    4150 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 619B051C
P 4150 5150
AR Path="/619B051C" Ref="R?"  Part="1" 
AR Path="/618FDA94/619B051C" Ref="R3"  Part="1" 
F 0 "R3" H 4220 5196 50  0000 L CNN
F 1 "100" H 4220 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4080 5150 50  0001 C CNN
F 3 "~" H 4150 5150 50  0001 C CNN
F 4 "C17408" H 4150 5150 50  0001 C CNN "LCSC"
	1    4150 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 5750 3850 5650
Wire Wire Line
	3850 5350 3850 5300
$Comp
L power:GND #PWR?
U 1 1 619B18F2
P 3850 5750
AR Path="/619B18F2" Ref="#PWR?"  Part="1" 
AR Path="/618FDA94/619B18F2" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 3850 5500 50  0001 C CNN
F 1 "GND" H 3855 5577 50  0000 C CNN
F 2 "" H 3850 5750 50  0001 C CNN
F 3 "" H 3850 5750 50  0001 C CNN
	1    3850 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 619B18F8
P 3850 5150
AR Path="/619B18F8" Ref="R?"  Part="1" 
AR Path="/618FDA94/619B18F8" Ref="R4"  Part="1" 
F 0 "R4" H 3920 5196 50  0000 L CNN
F 1 "100" H 3920 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 3780 5150 50  0001 C CNN
F 3 "~" H 3850 5150 50  0001 C CNN
F 4 "C17408" H 3850 5150 50  0001 C CNN "LCSC"
	1    3850 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3500 7750 3400
$Comp
L esp32-wrover:ESP32-WROVER U1
U 1 1 61919681
P 6900 4150
F 0 "U1" H 6875 5487 60  0000 C CNN
F 1 "ESP32-WROVER" H 6875 5381 60  0000 C CNN
F 2 "ESP32-WROVER-I:XCVR_ESP32-WROVER-I" H 7350 3850 60  0001 C CNN
F 3 "" H 7350 3850 60  0001 C CNN
F 4 "C529591" H 6900 4150 50  0001 C CNN "LCSC"
	1    6900 4150
	1    0    0    -1  
$EndComp
NoConn ~ 6000 4000
NoConn ~ 7750 4100
Text Notes 2200 5050 0    50   ~ 0
LED1 -> Encendido\nLED2 -> WIFI\nLED3 -> Abierto/Cerrado\nLED4 -> Battery  level 1\nLED5 -> Battery  level 2\nLED6 -> Battery  level 3
$Comp
L power:GND #PWR0107
U 1 1 619EDD3F
P 5950 4800
F 0 "#PWR0107" H 5950 4550 50  0001 C CNN
F 1 "GND" V 5955 4672 50  0000 R CNN
F 2 "" H 5950 4800 50  0001 C CNN
F 3 "" H 5950 4800 50  0001 C CNN
	1    5950 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 4800 6000 4800
Text HLabel 7750 4900 2    50   Input ~ 0
CERRADURA
$Comp
L power:GND #PWR0108
U 1 1 61A11262
P 7750 3400
F 0 "#PWR0108" H 7750 3150 50  0001 C CNN
F 1 "GND" V 7755 3272 50  0000 R CNN
F 2 "" H 7750 3400 50  0001 C CNN
F 3 "" H 7750 3400 50  0001 C CNN
	1    7750 3400
	0    -1   -1   0   
$EndComp
Connection ~ 7750 3400
Text HLabel 3550 3150 0    50   Input ~ 0
3v3
NoConn ~ 6000 5200
NoConn ~ 7750 5300
NoConn ~ 7750 5200
NoConn ~ 7750 5100
NoConn ~ 7750 5000
NoConn ~ 7750 4600
NoConn ~ 7750 4500
Wire Wire Line
	4100 3550 4100 3600
Wire Wire Line
	3550 3150 3700 3150
Wire Wire Line
	4100 3250 4100 3150
Connection ~ 4100 3150
Wire Wire Line
	3700 3250 3700 3150
Connection ~ 3700 3150
Wire Wire Line
	3700 3150 4100 3150
Wire Wire Line
	5200 3500 5200 3150
Wire Wire Line
	5200 3150 4900 3150
Connection ~ 4900 3150
Text HLabel 7750 4200 2    50   Input ~ 0
MISO
Text HLabel 7750 4300 2    50   Input ~ 0
SCK
Text HLabel 7750 3600 2    50   Input ~ 0
MOSI
NoConn ~ 7750 3700
Text HLabel 7750 4400 2    50   Input ~ 0
SDA
Wire Wire Line
	3850 4300 6000 4300
Wire Wire Line
	4150 4400 6000 4400
Wire Wire Line
	4450 4500 6000 4500
Wire Wire Line
	5050 5750 5050 5650
Wire Wire Line
	5050 5350 5050 5300
$Comp
L power:GND #PWR?
U 1 1 61974CAB
P 5050 5750
AR Path="/61974CAB" Ref="#PWR?"  Part="1" 
AR Path="/618FDA94/61974CAB" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 5050 5500 50  0001 C CNN
F 1 "GND" H 5055 5577 50  0000 C CNN
F 2 "" H 5050 5750 50  0001 C CNN
F 3 "" H 5050 5750 50  0001 C CNN
	1    5050 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61974CB1
P 5050 5150
AR Path="/61974CB1" Ref="R?"  Part="1" 
AR Path="/618FDA94/61974CB1" Ref="R6"  Part="1" 
F 0 "R6" H 5120 5196 50  0000 L CNN
F 1 "100" H 5120 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4980 5150 50  0001 C CNN
F 3 "~" H 5050 5150 50  0001 C CNN
F 4 "C17408" H 5050 5150 50  0001 C CNN "LCSC"
	1    5050 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5750 4750 5650
Wire Wire Line
	4750 5350 4750 5300
$Comp
L power:GND #PWR?
U 1 1 61974CBF
P 4750 5750
AR Path="/61974CBF" Ref="#PWR?"  Part="1" 
AR Path="/618FDA94/61974CBF" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 4750 5500 50  0001 C CNN
F 1 "GND" H 4755 5577 50  0000 C CNN
F 2 "" H 4750 5750 50  0001 C CNN
F 3 "" H 4750 5750 50  0001 C CNN
	1    4750 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4600 6000 4600
Wire Wire Line
	4750 4600 4750 5000
Wire Wire Line
	4450 4500 4450 5000
Wire Wire Line
	4150 4400 4150 5000
Wire Wire Line
	3850 4300 3850 5000
Wire Wire Line
	5350 5750 5350 5650
Wire Wire Line
	5350 5350 5350 5300
$Comp
L power:GND #PWR?
U 1 1 619A144B
P 5350 5750
AR Path="/619A144B" Ref="#PWR?"  Part="1" 
AR Path="/618FDA94/619A144B" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 5350 5500 50  0001 C CNN
F 1 "GND" H 5355 5577 50  0000 C CNN
F 2 "" H 5350 5750 50  0001 C CNN
F 3 "" H 5350 5750 50  0001 C CNN
	1    5350 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 619A1451
P 5350 5150
AR Path="/619A1451" Ref="R?"  Part="1" 
AR Path="/618FDA94/619A1451" Ref="R7"  Part="1" 
F 0 "R7" H 5420 5196 50  0000 L CNN
F 1 "100" H 5420 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5280 5150 50  0001 C CNN
F 3 "~" H 5350 5150 50  0001 C CNN
F 4 "C17408" H 5350 5150 50  0001 C CNN "LCSC"
	1    5350 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4700 5050 4700
Wire Wire Line
	5050 4700 5050 5000
Wire Wire Line
	5350 5000 5350 4900
Wire Wire Line
	5350 4900 6000 4900
Text HLabel 7750 3900 2    50   Input ~ 0
RX1
Text HLabel 7750 3800 2    50   Input ~ 0
TX1
Text HLabel 6000 3900 0    50   Input ~ 0
BTRLVL
NoConn ~ 7750 4000
Text HLabel 7750 4700 2    50   Input ~ 0
RST
Wire Wire Line
	4900 3150 4900 3250
Wire Wire Line
	4900 3600 4900 3550
Connection ~ 4900 3600
Wire Wire Line
	4900 3600 4600 3600
Text HLabel 7750 4800 2    50   Input ~ 0
BOOT
$Comp
L Device:C C4
U 1 1 61A1FE01
P 5450 3350
F 0 "C4" H 5565 3396 50  0000 L CNN
F 1 "100 pF" H 5565 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5488 3200 50  0001 C CNN
F 3 "~" H 5450 3350 50  0001 C CNN
F 4 "C44567" H 5450 3350 50  0001 C CNN "LCSC"
	1    5450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3500 5450 3500
Connection ~ 5450 3500
Wire Wire Line
	5450 3500 6000 3500
Wire Wire Line
	5450 3050 5450 3150
Wire Wire Line
	5450 3150 5850 3150
Wire Wire Line
	5850 3150 5850 3400
Wire Wire Line
	5850 3400 6000 3400
Connection ~ 5450 3150
Wire Wire Line
	5450 3150 5450 3200
Wire Wire Line
	4900 3600 6000 3600
$Comp
L Device:R R?
U 1 1 61974CC5
P 4750 5150
AR Path="/61974CC5" Ref="R?"  Part="1" 
AR Path="/618FDA94/61974CC5" Ref="R5"  Part="1" 
F 0 "R5" H 4820 5196 50  0000 L CNN
F 1 "100" H 4820 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4680 5150 50  0001 C CNN
F 3 "~" H 4750 5150 50  0001 C CNN
F 4 "C17408" H 4750 5150 50  0001 C CNN "LCSC"
	1    4750 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 619A1457
P 5350 5500
AR Path="/619A1457" Ref="D?"  Part="1" 
AR Path="/618FDA94/619A1457" Ref="D6"  Part="1" 
F 0 "D6" V 5389 5383 50  0000 R CNN
F 1 "lvl3" V 5298 5383 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5350 5500 50  0001 C CNN
F 3 "~" H 5350 5500 50  0001 C CNN
F 4 "C118330" V 5350 5500 50  0001 C CNN "LCSC"
	1    5350 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 61974CB7
P 5050 5500
AR Path="/61974CB7" Ref="D?"  Part="1" 
AR Path="/618FDA94/61974CB7" Ref="D5"  Part="1" 
F 0 "D5" V 5089 5383 50  0000 R CNN
F 1 "lvl2" V 4998 5383 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5050 5500 50  0001 C CNN
F 3 "~" H 5050 5500 50  0001 C CNN
F 4 "C138546" V 5050 5500 50  0001 C CNN "LCSC"
	1    5050 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 61974CCB
P 4750 5500
AR Path="/61974CCB" Ref="D?"  Part="1" 
AR Path="/618FDA94/61974CCB" Ref="D4"  Part="1" 
F 0 "D4" V 4789 5383 50  0000 R CNN
F 1 "lvl1" V 4698 5383 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4750 5500 50  0001 C CNN
F 3 "~" H 4750 5500 50  0001 C CNN
F 4 "C375447" V 4750 5500 50  0001 C CNN "LCSC"
	1    4750 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 619B0522
P 4150 5500
AR Path="/619B0522" Ref="D?"  Part="1" 
AR Path="/618FDA94/619B0522" Ref="D2"  Part="1" 
F 0 "D2" V 4189 5383 50  0000 R CNN
F 1 "Wifi" V 4098 5383 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4150 5500 50  0001 C CNN
F 3 "~" H 4150 5500 50  0001 C CNN
F 4 "C375447" V 4150 5500 50  0001 C CNN "LCSC"
	1    4150 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 61995CBF
P 4450 5500
AR Path="/61995CBF" Ref="D?"  Part="1" 
AR Path="/618FDA94/61995CBF" Ref="D1"  Part="1" 
F 0 "D1" V 4489 5383 50  0000 R CNN
F 1 "On" V 4398 5383 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4450 5500 50  0001 C CNN
F 3 "~" H 4450 5500 50  0001 C CNN
F 4 "C189306" V 4450 5500 50  0001 C CNN "LCSC"
	1    4450 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 619B18FE
P 3850 5500
AR Path="/619B18FE" Ref="D?"  Part="1" 
AR Path="/618FDA94/619B18FE" Ref="D3"  Part="1" 
F 0 "D3" V 3889 5383 50  0000 R CNN
F 1 "Open" V 3798 5383 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3850 5500 50  0001 C CNN
F 3 "~" H 3850 5500 50  0001 C CNN
F 4 "C118330" V 3850 5500 50  0001 C CNN "LCSC"
	1    3850 5500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 3150 4900 3150
Wire Wire Line
	4900 4000 4900 3950
Wire Wire Line
	4600 4000 4750 4000
Wire Wire Line
	4900 3650 4900 3600
Wire Wire Line
	4750 4000 4750 4050
Connection ~ 4750 4000
Wire Wire Line
	4750 4000 4900 4000
$EndSCHEMATC
