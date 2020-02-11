 

 

# FT SENSOR CALIBRATION


| **Rev.** |**Dep**|** Prepared  by **| **Date**|**Dep **                  |** Approved **  |** Date**         |
| -------- | ---------- | ----|-----|-----|------|---- |
| 0.0  | P&M          | Tome D.                | 15/04/2011 |              |             | 15/04/2011 |
| 1.0  | iCubFacility | Tome D. – Michelini S. | 05/03/2014 | iCubFacility | Randazzo M. | 05/03/2014 |
| 2.0  | iCubFacility | M.Maggiali             | 26-01-2018 |              |             |            |
| 2.1  | iCubFacility | D.Tomé                 | 17/04/19   |              |             |            |
| 2.2  | iCubFacility | D.Tomé                 | 15/07/2019 |              |             |            |
| 2.3  | iCubFacility | M.Borgagni - D.Tomè | 11/02/2020 |             iCubFacility | M. Accame             |11/02/2020            |




# Revision history

 

 

| **Rev.** | **Date**   | **Revision  description**                   |
| -------- | ---------- | ------------------------------------------------------------ |
| 0.0      | 15/04/2011 | Preliminary   emission                                       |
| 1.0      | 05/03/2014 | Added section 2.1  Matlab replaced by Octave  New report template |
| 2.0      | 26/01/2108 | Added picture of the STRAIN2 and wiring of STRAIN2  and other details. |
| 2.1      | 17/4/19    | E.Barbieri modified wiring diagram (p.11) to fit  with both old and new mechanics |
| 2.2.     | 15/07/2019 | Added image  that shows associations between pcb’s pads and analog channel numbers  (addendum 1) |
|2.3	          | 11/02/2020           |New Calibration Procedure                                                            |

 

 

 

 






Contents

[Revision history. 1](#_Toc14076537)

[1    TEST REQUIREMENTS. 3](#_Toc14076538)

[1.1   Software Requirements. 3](#_Toc14076539)

[1.2   Hardware Requirements. 3](#_Toc14076540)

[2    SENSOR ASSEMBLY.. 8](#_Toc14076541)

[2.1   Strain Gauge Resistance check. 8](#_Toc14076542)

[2.2   Short circuit Check. 13](#_Toc14076543)

[2.3   Pre calibration Check. 13](#_Toc14076544)

[3    CALIBRATION SETUP ASSEMBLY.. 17](#_Toc14076545)

[4    SENSOR CALIBRATION PROCEDURE.. 19](#_Toc14076546)

[4.1   Z+ pointing downwards 25kg traction. 20](#_Toc14076547)

[4.2   Z+ pointing downwards 5kg torques. 21](#_Toc14076548)

[4.3   Z+ pointing upwards 25kg compression. 22](#_Toc14076549)

[4.4   X+ pointing upwards 25kg. 23](#_Toc14076550)

[4.5   X- pointing upwards 25kg. 24](#_Toc14076551)

[4.6   “1” pointing downwards 25kg. 25](#_Toc14076552)

[4.7   “2” pointing downwards 25kg. 26](#_Toc14076553)

[4.8   “3” pointing downwards 25kg. 27](#_Toc14076554)

[4.9   “4” pointing downwards 25kg. 28](#_Toc14076555)

[4.10     X+ pointing upwards 5kg laterals. 29](#_Toc14076556)

[4.11     Y+ pointing upwards 5kg laterals. 30](#_Toc14076557)

[4.12     X- pointing upwards 5kg laterals. 31](#_Toc14076558)

[4.13     Y- pointing upwards 5kg laterals. 32](#_Toc14076559)

[4.14     Generating Calibration Matrix. 33](#_Toc14076560)

[4.15     Uploading calibration matrix. 35](#_Toc14076561)

[4.16     Committing sensor calibration folder 37](#_Toc14076562)

[5    SENSOR CALIBRATION REPORT.. 38](#_Toc14076563)

[6    ADDENDUM... 40](#_Toc14076564)

[6.1   STRAIN2 PCB PADS-CHANNEL RELATIONSHIP. 40](#_Toc14076565)



# 1   TEST REQUIREMENTS

## 1.1    Software Requirements
- A PC with Windows 10
- “Canreal” software (included in iCub)
- “Gulp” software
- Preconfigured  virtual machine **scrivere link alla virtual machine**
- “SVN” subversion software **scrivere link alla repo sensori**

## 1.2    Hardware Requirements
- 1 strain gauge sensor “**GS**” (Figure 1)
- 1 bottom cover for strain gauge     sensor “**BC**”(Figure 1)
- 1 top cover for Strain Gauge     Sensor “**TC**”(Figure 1)
- 1 PCB STRAIN2, (**IITCODE 11996.x)** “**STR**” (Figure 1)
- 3 sets of 6 tinned cables with     these spec : length = 33mm , colors : Blue, Red, Yellow, Green, Black,     White “**CAB1**” (Figure 1)
- 1 cable for connecting the     sensor to power and CAN-USB (**IITCODE 12478.x**)     “**CAB2**”(Figure 1)

 <img src ="../img/Fig 1 da sostiuire.JPG" height = 500px>                             

Figure 1: Strain gauge sensor, strain pcb, cables and covers

------------------------------------------

**Serve nuova foto con strain2, meccanica nuova e i fili 3 per colore anziché 2** 

- 1 STRAIN2_ProgramInterface **IITCODE 12348.x** (Figure 2)

  <img src ="../img/Fig2_STRAIN2_ProgrammInterface.JPG" height = 390px>    

Figure 2 STRAIN2_ProgramInterface

------------------------------------

- 6 6x12x2 mm screws “SC3” (Figure 3)
- 6 6x8x2 mm screws “SC4” (Figure 3)

<img src ="../img/Fig3_Viti---da_sostituire.JPG" height = 500px>   

Figure 3: Screws

**Serve nuovo set di viti e relative foto**

------------------------------------------------------

- 1 custom made cross “**CR1**” (Figure 4)
- 1 custom made head “**H1**” (Figure 4)
- 1 custom made head “**H2**” (Figure 4)
- 1 nut FeZn 10MA.2 “**N1**” (Figure 4) 
- 6 3x16x2mm inox countersunk     hexagonal screws “**SC1**” (Figure 4)
- 6 3x18x2.5mm inox hexagonal     screws “**SC2**” (Figure 4)

**SC1 e SC2 non cambiano?**

<img src ="../img/FIG4_Custom_made_cross_heads_nut.JPG" height = 500px>   

Figure 4: Custom made cross, heads and the nut

---------------------------

<img src ="../img/Fig5_Custom_made_H_Bracket.JPG" height = 500px>

Figure 5: Custom made H bracket
- ------------------------------
- 1 tightening knob “**K1**” (Figure 6)
- 1 Set of spacers “**S1**” (Figure 6)
- 1 Z axis extension “**EXT1**” (Figure 6)

<img src ="../img/FIG6_Custom_made_spacer_Zaxis_ext_and_knob.jpg" height = 500px> 

Figure 6: Custom made spacer, Z axis extension and knob

- --------------------

- 1 Z axis extension “**EXT2**” (Figure 7)

<img src ="../img/Fig7_Custom_made_Z_axis_ext.jpg" height = 500px>

Figure 7: Custom made Z axis extension

- --------------------------

- 1 2mm torque screwdriver “**TS1**” (Figure 8)
- 1 2mm hexagonal     screwdriver “**HS1**” (Figure 8)
- 1 2.5mm hexagonal     screwdriver “**HS2**” (Figure 8)
- 1 wrench 17mm “**W1**” (Figure 8)

<img src ="../img/Fig8_Screwdrivers.jpg" height = 500px>

Figure 8: Screwdrivers

----------------------------------

- Clamps to fix the structure “**CL1**” (Figure 9)

<img src ="../img/Fig9_Clamps.jpg" height = 500px>

Figure 9: Clamps

---------------

- 1 CAN-USB with power and can     bus connection cables 3333.B (Figure 10)


<img src ="../img/Fig10-CAN-USB_with-its_cables_and_connection_with_FT_SENSOR.jpg" height = 500px>

Figure 10: CAN-USB with its cables and connection with the FT-SENSOR

------------------

-     1 25Kg load

-     1 5Kg load

# 2   SENSOR ASSEMBLY


!!! warning  
    **Handle the sensor taking care not to break thin wires**

## 2.1    Strain Gauge Resistance check

**TEST:** Take the sensor and measure the resistance of each couple of pads for each of three groups as shown below and fill in the respective test report field.


<img src ="../img/Fig11_Strain_gauge_sensor_resistance_check.jpg" height = 500px>

Figure 11: Strain gauge sensor resistance check

 

| Pads  Couple | Resistance  +/- 40% |
| ------------ | ------------------- |
| 1-2          | 430 Ohm             |
| 2-6          | 430 Ohm             |
| 3-5          | 430 Ohm             |
| 4-5          | 430 Ohm             |

Fill in the table in the test reports with values of the resistive strain gauge. 

!!! warning
    Attention! comply with the pairs as shown.

-     Solder the wires CAB1 ( Figure 1 )  to the sensor as shown below


<img src ="../img/Fig12_Sensor_Wired.jpg" height = 500px>  

Figure 12: Sensor  wired

|Pin	|Colour| 
| ---- | ------ |
| 1    | GREEN  |
| 2    | RED    |
| 3    | BLUE   |
| 4    | YELLOW |
| 5    | BLACK  |
| 6    | WHITE  |

______________________________________



-    Pass the wires CAB1 (Figure 1) according images below

    

<img src ="../img/Fig13_Wirre_configuration.jpg" height = 500px>

Figure 13: Wire configuration

-    Solder the wires CAB1 (Figure 1) to the Strain PCB as shown below



  

Figure 14: Sensor wired to the Strain PCB (the sequence of the wires is equal from STRAIN and STRAIN2)

 

| **1** | **BLUE** |
| ----- | -------- |
| 2     | RED      |
| 3     | YELLOW   |
| 4     | GREEN    |
| 5     | BLACK    |
| 6     | WHITE    |






·     Solder the wires CAB2 (Figure 1) to the Strain PCB as shown below

 

 

 

  

  

Figure 15 Wiring of the STRAIN2

 

 













 

·     Assembly the sensor with its covers TC and BC (Figure 1) using appropriate screws tightening them using the torque screwdriver TS1 (Figure 8) settled at 2N/m as described in the following page

**Il disegno sotto è superato dalla meccanica nuova** 

  

## 2.2    Short circuit Check

·     Test the wires black red green and white (molex connector) between them and read the resistive values. 

 

| RED - GREEN                      | Open Circuit |
| -------------------------------- | ------------ |
| RED - WHITE                      | Open Circuit |
| RED - BLACK                      | Open Circuit |
| GREEN - WHITE                    | ± 70KΩ       |
| GREEN - BLACK                    | Open Circuit |
| WHITE - BLACK                    | Open Circuit |
| YELLOW - BLACK                   | Open Circuit |
| TURQUOISE - BLACK                | Open Circuit |
| BLACK - chassy of the sensor     | Open Circuit |
| WHITE - chassy of the sensor     | Open Circuit |
| RED - chassy of the sensor       | Open Circuit |
| GREEN - chassy of the sensor     | Open Circuit |
| YELLOW - chassy of the sensor    | Open Circuit |
| TURQUOISE - chassy of the sensor | Open Circuit |

 

**Cambiato da Mohm a OPEN circuit tutti** 

 

·     If you do not respect the values shown in the table  STOP CALIBRATION AND GIVE BACK TO IIT THE SENSOR FOR INVESTIGATION