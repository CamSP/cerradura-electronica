EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L rc522:RC522 U2
U 1 1 618EAA58
P 4250 3350
F 0 "U2" H 4625 4115 50  0000 C CNN
F 1 "RC522" H 4625 4024 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B8B-EH-A_1x08_P2.50mm_Vertical" H 4600 4100 50  0001 C CNN
F 3 "" H 4600 4100 50  0001 C CNN
	1    4250 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 618EACB7
P 5200 3000
F 0 "#PWR0109" H 5200 2750 50  0001 C CNN
F 1 "GND" V 5205 2872 50  0000 R CNN
F 2 "" H 5200 3000 50  0001 C CNN
F 3 "" H 5200 3000 50  0001 C CNN
	1    5200 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 3000 5100 3000
Text HLabel 5100 3300 2    50   Input ~ 0
3v3
Text HLabel 4150 3300 0    50   Input ~ 0
MISO
Text HLabel 4150 3150 0    50   Input ~ 0
MOSI
Text HLabel 4150 3000 0    50   Input ~ 0
SCK
Text HLabel 4150 2850 0    50   Input ~ 0
SDA
Text HLabel 5100 3150 2    50   Input ~ 0
RST
NoConn ~ 5100 2850
$EndSCHEMATC
