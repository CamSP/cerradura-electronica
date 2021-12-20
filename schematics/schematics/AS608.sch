EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
L as608:AS608 U3
U 1 1 61955EC3
P 5350 3100
AR Path="/61955EC3" Ref="U3"  Part="1" 
AR Path="/618F1B77/61955EC3" Ref="U3"  Part="1" 
F 0 "U3" H 5725 3715 50  0000 C CNN
F 1 "AS608" H 5725 3624 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B4B-EH-A_1x04_P2.50mm_Vertical" H 5100 3150 50  0001 C CNN
F 3 "" H 5100 3150 50  0001 C CNN
F 4 "C144395" H 5350 3100 50  0001 C CNN "LCSC"
	1    5350 3100
	1    0    0    -1  
$EndComp
Text HLabel 5250 3000 0    50   Input ~ 0
TX
Text HLabel 6200 3000 2    50   Input ~ 0
RX
$Comp
L power:GND #PWR0114
U 1 1 6195671F
P 6200 2750
F 0 "#PWR0114" H 6200 2500 50  0001 C CNN
F 1 "GND" V 6205 2622 50  0000 R CNN
F 2 "" H 6200 2750 50  0001 C CNN
F 3 "" H 6200 2750 50  0001 C CNN
	1    6200 2750
	0    -1   -1   0   
$EndComp
Text HLabel 5250 2750 0    50   Input ~ 0
3v3
$EndSCHEMATC
