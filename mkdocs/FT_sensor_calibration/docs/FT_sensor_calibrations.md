 

 

# FT SENSOR CALIBRATION

| **Rev.** |**Dep**|** Prepared  by **| **Date**|**Dep **                  |** Approved **  |** Date**         |
| -------- | ---------- | ----|-----|-----|------|---- |
| 0.0  | P&M          | Tome D.                | 15/04/2011 |              |             | 15/04/2011 |
| 1.0  | iCubFacility | Tome D. – Michelini S. | 05/03/2014 | iCubFacility | Randazzo M. | 05/03/2014 |
| 2.0  | iCubFacility | M.Maggiali             | 26-01-2018 |              |             |            |
| 2.1  | iCubFacility | D.Tomé                 | 17/04/19   |              |             |            |
| 2.2  | iCubFacility | D.Tomé                 | 15/07/2019 |              |             |            |
| 2.3  | iCubFacility | M.Borgagni - D.Tomè | 11/02/2020 |             iCubFacility | M. Accame             |11/02/2020            |




##  Revision history

 

 

| **Rev.** | **Date**   | **Revision  description**                   |
| -------- | ---------- | ------------------------------------------------------------ |
| 0.0      | 15/04/2011 | Preliminary   emission                                       |
| 1.0      | 05/03/2014 | Added section 2.1  Matlab replaced by Octave  New report template |
| 2.0      | 26/01/2108 | Added picture of the STRAIN2 and wiring of STRAIN2  and other details. |
| 2.1      | 17/4/19    | E.Barbieri modified wiring diagram (p.11) to fit  with both old and new mechanics |
| 2.2.     | 15/07/2019 | Added image  that shows associations between pcb’s pads and analog channel numbers  (add. 1) |
|2.3	          | 11/02/2020           |New Calibration Procedure                                                            |



## 1. TEST REQUIREMENTS

### 1.1 Software Requirements

- Create a **icub-tech** folder under C: (just to keep some files)
- ESD CAN SDK (contains CanReal) : \\\storage05.icub.iit.local\repository\common\drivers_and_software\esd_can\can_sdk_v620.zip 
-  Gulp (copy both files, install gulp and then wincap): `\\storage05.icub.iit.local\repository\mechatronics\electronics\Organization\GULP`
- ORACLE VirtualBox(download also **VirtualBox Extension Pack**, install **virtual box** then **ext pack**):  https://www.virtualbox.org/wiki/Downloads  
  
- Tortoise SVN:
https://tortoisesvn.net/downloads.html
 
- GIT for Windows :
https://git-scm.com/download/win

- Tortoise GIT:
https://tortoisegit.org/download/

- ST-LINK Utility (for flashing updated bootloader and firmware) :
`\\storage05.icub.iit.local\repository\production\TEST STUFF\SoftwareToInstall\ST-LINK Utility`
 
- ESD CAN-USB Drivers (copy in **icub-tech**, to be used for driver installation of ESD CAN-USB 2066):  
                        `\\storage05.icub.iit.local\repository\production\TEST STUFF\SoftwareToInstall\CAN_CD_V11`
-  Ubuntu 18.04 LTS VM (ready to go with yarp, icub, ftSens repo etc.; copy in **icub-tech**):
   `\\storage05.icub.iit.local\repository\production\TEST STUFF\VM\ubuntu 18.04.7z` 
- FT Sensor Repository 
https://svn.icub.iit.local/repos/mecha/ftSensCalib/trunk)`

### 1.2 Hardware Requirements
- 1 strain gauge sensor “**GS**” (Figure 1)
- 1 bottom cover for strain gauge     sensor “**BC**”(Figure 1)
- 1 top cover for Strain Gauge     Sensor “**TC**”(Figure 1)
- 1 PCB STRAIN2, (**IITCODE 11996.x)** “**STR**” (Figure 1)
- 3 sets of 6 tinned cables with     these spec : length = 33mm , colors : Blue, Red, Yellow, Green, Black,     White “**CAB1**” (Figure 1)
- 1 cable for connecting the     sensor to power and CAN-USB (**IITCODE 12478.x**)     “**CAB2**”(Figure 1)

 <img src ="../img/Fig 1 da sostiuire.JPG" height = 500px>                             

Figure 1: Strain gauge sensor, strain pcb, cables and covers

**________________________________________________________________________________________________**

**Serve nuova foto con strain2, meccanica nuova e i fili 3 per colore anziché 2** 

- 1 STRAIN2_ProgramInterface **IITCODE 12348.x** (Figure 2)

  <img src ="../img/Fig2_STRAIN2_ProgrammInterface.JPG" height = 390px>    

Figure 2 STRAIN2_ProgramInterface

**________________________________________________________________________________________________**

- 6 6x12x2 mm screws “SC3” (Figure 3)
- 6 6x8x2 mm screws “SC4” (Figure 3)

<img src ="../img/Fig3_Viti---da_sostituire.JPG" height = 500px>   

Figure 3: Screws

**Serve nuovo set di viti e relative foto**

**________________________________________________________________________________________________**

- 1 custom made cross “**CR1**” (Figure 4)
- 1 custom made head “**H1**” (Figure 4)
- 1 custom made head “**H2**” (Figure 4)
- 1 nut FeZn 10MA.2 “**N1**” (Figure 4) 
- 6 3x16x2mm inox countersunk     hexagonal screws “**SC1**” (Figure 4)
- 6 3x18x2.5mm inox hexagonal     screws “**SC2**” (Figure 4)

**SC1 e SC2 non cambiano?**

<img src ="../img/FIG4_Custom_made_cross_heads_nut.JPG" height = 500px>   

Figure 4: Custom made cross, heads and the nut

**________________________________________________________________________________________________**

<img src ="../img/Fig5_Custom_made_H_Bracket.JPG" height = 500px>

Figure 5: Custom made H bracket
**________________________________________________________________________________________________**

- 1 tightening knob “**K1**” (Figure 6)
- 1 Set of spacers “**S1**” (Figure 6)
- 1 Z axis extension “**EXT1**” (Figure 6)

<img src ="../img/FIG6_Custom_made_spacer_Zaxis_ext_and_knob.jpg" height = 500px> 

Figure 6: Custom made spacer, Z axis extension and knob

**________________________________________________________________________________________________**

- 1 Z axis extension “**EXT2**” (Figure 7)

<img src ="../img/Fig7_Custom_made_Z_axis_ext.jpg" height = 500px>

Figure 7: Custom made Z axis extension

**________________________________________________________________________________________________**

- 1 2mm torque screwdriver “**TS1**” (Figure 8)
- 1 2mm hexagonal     screwdriver “**HS1**” (Figure 8)
- 1 2.5mm hexagonal     screwdriver “**HS2**” (Figure 8)
- 1 wrench 17mm “**W1**” (Figure 8)

<img src ="../img/Fig8_Screwdrivers.jpg" height = 500px>

Figure 8: Screwdrivers

**________________________________________________________________________________________________**

- Clamps to fix the structure “**CL1**” (Figure 9)

<img src ="../img/Fig9_Clamps.jpg" height = 500px>

Figure 9: Clamps

**________________________________________________________________________________________________**

- 1 CAN-USB with power and can     bus connection cables 3333.B (Figure 10)


<img src ="../img/Fig10-CAN-USB_with-its_cables_and_connection_with_FT_SENSOR.jpg" height = 500px>

Figure 10: CAN-USB with its cables and connection with the FT-SENSOR

**________________________________________________________________________________________________**

-     1 25Kg load

-     1 5Kg load

## 2   SENSOR ASSEMBLY


!!! warning  
    **Handle the sensor taking care not to break thin wires**

### 2.1    Strain Gauge Resistance check

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

**________________________________________________________________________________________________**



-    Pass the wires CAB1 (Figure 1) according images below

​    

<img src ="../img/Fig13_Wirre_configuration.jpg" height = 400px>

Figure 13: Wire configuration

**________________________________________________________________________________________________**

-    Solder the wires CAB1 (Figure 1) to the Strain PCB as shown below



<img src ="../img/Fig14_Sensor wired to the Strain-2 PCB.jpg" height = 550px>


Figure 14: Sensor wired to the Strain PCB (the sequence of the wires is equal from STRAIN and STRAIN2)

|**Pin** |**Colour**
| ----- | -------- |
| 1     | BLUE     |
| 2     | RED      |
| 3     | YELLOW   |
| 4     | GREEN    |
| 5     | BLACK    |
| 6     | WHITE    |


**________________________________________________________________________________________________**


-    Solder the wires CAB2 (Figure 1) to the Strain PCB as shown below

<img src ="../img/FIG15B_Wiring_Strain2.jpg" height = 400px>
 


Figure 15A Wiring of the STRAIN2

**________________________________________________________________________________________________**

<img src ="../img/FIG15A_strain2_connection.jpg" height = 500px>


Fig 15B Capital scheme of the strain-2 connections
**________________________________________________________________________________________________**
 

-     Assembly the sensor with its covers TC and BC (Figure 1) using appropriate screws tightening them using the torque screwdriver TS1 (Figure 8) settled at 2N/m as described in the following **drawing link and extracted notes**

[**Link to new mechanical drawing**](../img/ic_008_a_001_new_mec.pdf)

!!! NOTES
    Steps to be taken before assembling and calibrating the FT sensor. Contact technical office for any information about this procedure.

- You need to pre-assemble the FT sensor with the top and bottom covers, central sensor and screws (as shown in Fig.Step1).

- Align the holes for dowel pins before tightening the screws of the bottom and top covers.
 
- Drill holes of n1.9mm for the dowel pins on &model_name:16 and &model_name:14 and increase them to &d59:1. Test the holes using a Dowel pin of size: ISO 2338B n3.
 
- Drill holes of n1.9mm for the dowel pins on &model_name:0 and increase them to &d129:1. The pins will be interference fit on this component.
  
- **VERY IMPORTANT**: You have to engrave a" part number" -" serial number" on the three parts which were just assembled with the same denominations used in the production department of IIT before you can disassemble it.
- The part number for this assembly is 12487 , about the S/N ask to IIT Production department. Typically, the format is the following: "00000 - S/N000" where the zeroes stand for a 5-digit and a 3-digit numerical code.
  
- Send the part IC_008_P_001 for gluing on the strain gauge. (Refer to Fig.STEP 2) 

- Assemble the FT sensor (as shown in Fig.STEP 3) and calibrate it according to IIT specifications

  

### 2.2   Short circuit Check

·     Test the wires black red green and white (molex connector) between them and read the resistive values. 

| Color wire connections| Result|
| -------------------------------- | ------------ |
| RED - GREEN                      | Open Circuit |
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

!!! warning
    If you do not respect the values shown in the table **STOP CALIBRATION AND GIVE BACK TO IIT THE SENSOR FOR INVESTIGATION**
    
