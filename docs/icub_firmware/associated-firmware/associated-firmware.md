# **Associated Firmware**
This page reports the association `board/address/firmware` version either for `CAN` and `ETH` based robots

## **CAN based robots**
---
### **CAN Networks**
The iCub 1.0.0 four can bus network are used (ids range from 0 to 3)

- 0 head network, device pcan
- 1 left arm network, device pcan
- 2 right arm network, device pcan
- 3 legs network, device pcan

On iCub 1.1.0 two ecan devices are added to the existing pcans.

- 0 head network, device pcan
- 1 left arm network, device pcan
- 2 right arm network, device pcan
- 3 legs network, device pcan

- left hand: device ecan, variable id
- right hand: device ecan, variable id

On iCub 1.2.0 the cfw2can board is used (ids range from 0 to 8).

- 0 head network, device cfw2can
- 1 left arm network, device cfw2can
- 2 right arm network, device cfw2can
- 3 left leg network, device cfw2can
- 4 right leg network, device cfw2can
- 5 left hand, device cfw2can
- 6 right hand, device cfw2can
- 7 left hand skin network, device cfw2can
- 8 right hand skin network, device cfw2can

On iCub 1.3.0 the cfw2can board is used (ids range from 0 to 8).

- 0 head network, device cfw2can
- 1 left arm network, device cfw2can
- 2 right arm network, device cfw2can
- 3 left leg network, device cfw2can
- 4 right leg network, device cfw2can
- 5 left hand, device cfw2can
- 6 right hand, device cfw2can
- 7 left hand and forearm skin network, device cfw2can
- 8 right hand and forearm skin network, device cfw2can

On iCub 1.3.1 the Head V2.0 is installed on a 1.3.0 robot.

On iCub 2 the cfw2can board is used (ids range from 0 to 9).

- 0 head network, device cfw2can
- 1 left arm network, device cfw2can
- 2 right arm network, device cfw2can
- 3 left leg network, device cfw2can
- 4 right leg network, device cfw2can
- 5 left hand, device cfw2can
- 6 right hand, device cfw2can
- 7 left hand, forearm and upperarm skin network, device cfw2can
- 8 right hand forearm and upperarm skin network, device cfw2can
- 9 torso skin network, device cfw2can

<br />

### **iCub V1.0**
---
We here describe the CAN-bus networks structure of the iCub v1.0. The version 1.0 uses the CFW board which has 4 canbus lines.

<span style="color:red">This version of iCub is no more supported. Firmware versions marked in red have been removed from the main repository.</span>


| can-bus network | configuration file    | associated robot part                                       |
|-----------------|-----------------------|-------------------------------------------------------------|
| pcan-0          | icub\_head\_torso.ini | head (entries 0 to 5) and torso (entries 6 to 8)            |
| pcan-1          | icub\_left\_arm.ini   | left\_arm                                                   |
| pcan-2          | icub\_right\_arm.ini  | right\_arm                                                  |
| pcan-3          | icub\_legs\_leg.ini   | left\_leg (entries 0 to 5) and right\_leg (entries 6 to 11) |

Details on the control boards connected to each network are given below.

#### **PCAN0: Head and Torso**
##### **_Head_**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 0B0        | -&gt; | 0 (pcan)     | 1 (2)   | 4DC.1.11.out.S |
| 0B1        | -&gt; | 0 (pcan)     | 3 (4)   | 4DC.1.15.out.S |

##### **_Torso_**
| boardLabel |       | canDeviceNum | boardId | firmware        |
|------------|-------|--------------|---------|-----------------|
|            |       |              |         |                 |
| 0B3        | -&gt; | 0 (pcan)     | 6       | 2BLL.1.52.out.S |
| 0B4        | -&gt; | 0 (pcan)     | 5       | 2BLL.1.54.out.S |

#### **PCAN1: Left arm**
| boardLabel |       | canDeviceNum | boardId | firmware                                       |
|------------|-------|--------------|---------|------------------------------------------------|
|            |       |              |         |                                                |
| 1B0        | -&gt; | 1 (pcan)     | 1       | 2BLL.1.50.out.S                                |
| 1B1        | -&gt; | 1 (pcan)     | 2       | <span style="color:red">2BLL.1.53.out.S</span> |
| 1B2        | -&gt; | 1 (pcan)     | 3 (4)   | 4DC.1.19.out.S                                 |
| 1B3        | -&gt; | 1 (pcan)     | 5 (6)   | <span style="color:red">4DC.1.18.out.S</span>  |
| 1B4        | -&gt; | 1 (pcan)     | 7 (8)   | <span style="color:red">4DC.1.20.out.S</span>  |

#### **PCAN2: Right arm**
| boardLabel |       | canDeviceNum | boardId | firmware                                       |
|------------|-------|--------------|---------|------------------------------------------------|
|            |       |              |         |                                                |
| 2B0        | -&gt; | 2 (pcan)     | 1       | 2BLL.1.50.out.S                                |
| 2B1        | -&gt; | 2 (pcan)     | 2       | <span style="color:red">2BLL.1.53.out.S</span> |
| 2B2        | -&gt; | 2 (pcan)     | 3 (4)   | 4DC.1.19.out.S                                 |
| 2B3        | -&gt; | 2 (pcan)     | 5 (6)   | <span style="color:red">4DC.1.18.out.S</span>  |
| 2B4        | -&gt; | 2 (pcan)     | 7 (8)   | <span style="color:red">4DC.1.20.out.S</span>  |

#### **PCAN3: Legs**
| boardLabel                           |       | canDeviceNum | boardId | firmware        |
|--------------------------------------|-------|--------------|---------|-----------------|
|                                      |       |              |         |                 |
| 3B5                                  | -&gt; | 3 (pcan)     | 5       | 2BLL.1.51.out.S |
| 3B6                                  | -&gt; | 3 (pcan)     | 6       | 2BLL.1.51.out.S |
| 3B7                                  | -&gt; | 3 (pcan)     | 7       | 2BLL.1.51.out.S |
| 3B8                                  | -&gt; | 3 (pcan)     | 8       | 2BLL.1.51.out.S |
| 3B9                                  | -&gt; | 3 (pcan)     | 9       | 2BLL.1.51.out.S |
| 3B10                                 | -&gt; | 3 (pcan)     | 10      | 2BLL.1.51.out.S |

<br />

### **iCub V1.1.0**
---
We here describe the CAN-bus networks structure of the iCub v1.1. The version 1.1 uses the CFW board which has 4 canbus lines and 2 esd-can device. Overall we have 6 canbus lines: 4 pcan and 2 ecan. Additionaly, the robot is equipped with MAIS and STRAIN analog sensors.

| can-bus network  | configuration file    | associated robot part                                       |
|------------------|-----------------------|-------------------------------------------------------------|
| pcan-0           | icub\_head\_torso.ini | head (entries 0 to 5) and torso (entries 6 to 8)            |
| pcan-1           | icub\_left\_arm.ini   | left\_arm (joints 0 to 7)                                   |
| pcan-2           | icub\_right\_arm.ini  | right\_arm (joints 0 to 7)                                  |
| pcan-3           | icub\_legs.ini        | left\_leg (entries 0 to 5) and right\_leg (entries 6 to 11) |
| ecan-0 or ecan-1 | icub\_left\_hand.ini  | left\_arm (joints 8 to 15)                                  |
| ecan-0 or ecan-1 | icub\_right\_hand.ini | right\_arm (joints 8 to 15)                                 |


Details on the control boards connected to each network are given below.


#### **PCAN0: Head and Torso**
##### **_Head_**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 0B0        | -&gt; | 0 (pcan)     | 1 (2)   | 4DC.1.11.out.S |
| 0B1        | -&gt; | 0 (pcan)     | 3 (4)   | 4DC.1.15.out.S |

##### **_Torso_**
| boardLabel |       | canDeviceNum | boardId | firmware        |
|------------|-------|--------------|---------|-----------------|
|            |       |              |         |                 |
| 0B3        | -&gt; | 0 (pcan)     | 6       | 2BLL.1.52.out.S |
| 0B4        | -&gt; | 0 (pcan)     | 5       | 2BLL.1.54.out.S |


#### **PCAN1: Left arm**
| boardLabel              |       | canDeviceNum | boardId | firmware        |
|-------------------------|-------|--------------|---------|-----------------|
|                         |       |              |         |                 |
| 1B0                     | -&gt; | 1 (pcan)     | 1       | 2BLL.1.50.out.S |
| 1B1                     | -&gt; | 1 (pcan)     | 2       | 2BLL.1.57.out.S |
| 1B2                     | -&gt; | 1 (pcan)     | 3 (4)   | 4DC.1.19.out.S  |
| virtual FT joint sensor | -&gt; | 1 (pcan)     | 12      | \- - -          |
| Strain                  | -&gt; | 1 (pcan)     | 13      | strain.hex      |

#### **ECAN1: Left hand**
| boardLabel              |       | canDeviceNum | boardId | firmware       |
|-------------------------|-------|--------------|---------|----------------|
|                         |       |              |         |                |
| 1B3                     | -&gt; | 1 (ecan)     | 5 (6)   | 4DC.1.28.out.S |
| 1B4                     | -&gt; | 1 (ecan)     | 7 (8)   | 4DC.1.30.out.S |
| virtual FT joint sensor | -&gt; | 1 (ecan)     | 12      | \- - -         |
| MAIS                    | -&gt; | 1 (ecan)     | 14      | mais.hex       |

#### **PCAN2: Right arm**
| boardLabel              |       | canDeviceNum | boardId | firmware        |
|-------------------------|-------|--------------|---------|-----------------|
|                         |       |              |         |                 |
| 2B0                     | -&gt; | 2 (pcan)     | 1       | 2BLL.1.50.out.S |
| 2B1                     | -&gt; | 2 (pcan)     | 2       | 2BLL.1.57.out.S |
| 2B2                     | -&gt; | 2 (pcan)     | 3 (4)   | 4DC.1.19.out.S  |
| virtual FT joint sensor | -&gt; | 2 (pcan)     | 12      | \- - -          |
| Strain                  | -&gt; | 2 (pcan)     | 13      | strain.hex      |


#### **ECAN0: Right hand**
| boardLabel              |       | canDeviceNum | boardId | firmware       |
|-------------------------|-------|--------------|---------|----------------|
|                         |       |              |         |                |
| 2B3                     | -&gt; | 2 (ecan)     | 5 (6)   | 4DC.1.28.out.S |
| 2B4                     | -&gt; | 2 (ecan)     | 7 (8)   | 4DC.1.30.out.S |
| virtual FT joint sensor | -&gt; | 2 (ecan)     | 12      | \- - -         |
| MAIS                    | -&gt; | 2 (ecan)     | 14      | mais.hex       |

#### **PCAN3: Legs**
| boardLabel                           |       | canDeviceNum | boardId | firmware        |
|--------------------------------------|-------|--------------|---------|-----------------|
|                                      |       |              |         |                 |
| 3B5                                  | -&gt; | 3 (pcan)     | 5       | 2BLL.1.51.out.S |
| 3B6                                  | -&gt; | 3 (pcan)     | 6       | 2BLL.1.51.out.S |
| 3B7                                  | -&gt; | 3 (pcan)     | 7       | 2BLL.1.51.out.S |
| 3B8                                  | -&gt; | 3 (pcan)     | 8       | 2BLL.1.51.out.S |
| 3B9                                  | -&gt; | 3 (pcan)     | 9       | 2BLL.1.51.out.S |
| 3B10                                 | -&gt; | 3 (pcan)     | 10      | 2BLL.1.51.out.S |
| virtual FT joint sensor (left\_leg)  | -&gt; | 3 (pcan)     | 12      | \- - -          |
| Strain (left\_leg)                   | -&gt; | 3 (pcan)     | 13      | strain.hex      |
| virtual FT joint sensor (right\_leg) | -&gt; | 3 (pcan)     | 11      | \- - -          |
| Strain (right\_leg)                  | -&gt; | 3 (pcan)     | 14      | strain.hex      |

<br />

### **iCub v1.2.0**
---
We here describe the CAN-bus networks structure of the iCub v1.2.0. The version 1.2.0 uses the CFW2 board which has 10 can-Bus lines available.

| can-bus network | configuration file    | associated robot part       |
|-----------------|-----------------------|-----------------------------|
| 0               | icub\_head\_torso.ini | head and torso              |
| 1               | icub\_left\_arm.ini   | left\_arm (joints 0 to 7)   |
| 2               | icub\_right\_arm.ini  | right\_arm (joints 0 to 7)  |
| 3               | icub\_left\_leg.ini   | left\_leg                   |
| 4               | icub\_right\_leg.ini  | right\_leg                  |
| 5               | icub\_left\_hand.ini  | left\_arm (joints 8 to 15)  |
| 6               | icub\_right\_hand.ini | right\_arm (joints 8 to 15) |
| 7               | skinlefthand.ini      | left\_hand skin             |
| 8               | skinrighthand.ini     | right\_hand skin            |                              |

Details on the control boards connected to each network are given in the following.

#### **CFW2CAN0: Head and Torso**
##### **_Head_**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 0B0        | -&gt; | 0 (pcan)     | 1 (2)   | 4DC.1.11.out.S |
| 0B1        | -&gt; | 0 (pcan)     | 3 (4)   | 4DC.1.15.out.S |

##### **_Torso_**
| boardLabel |       | canDeviceNum | boardId | firmware        |
|------------|-------|--------------|---------|-----------------|
|            |       |              |         |                 |
| 0B3        | -&gt; | 0 (pcan)     | 6       | 2BLL.1.52.out.S |
| 0B4        | -&gt; | 0 (pcan)     | 5       | 2BLL.1.54.out.S |

#### **CFW2CAN1: Left arm**
| boardLabel                         |       | canDeviceNum | boardId | firmware        |
|------------------------------------|-------|--------------|---------|-----------------|
|                                    |       |              |         |                 |
| 1B0                                | -&gt; | 1 (cfw2can)  | 1       | 2BLL.1.50.out.S |
| 1B1                                | -&gt; | 1 (cfw2can)  | 2       | 2BLL.1.57.out.S |
| 1B2                                | -&gt; | 1 (cfw2)     | 3 (4)   | 4DC.1.19.out.S  |
| virtual FT joint sensor (shoulder) | -&gt; | 1 (cfw2can)  | 12      | \- - -          |
| virtual FT joint sensor (wrist)    | -&gt; | 1 (cfw2can)  | 11      | \- - -          |
| Strain                             | -&gt; | 1 (cfw2can)  | 13      | strain.hex      |

#### **CFW2CAN5: Left hand**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 1B3        | -&gt; | 5 (cfw2can)  | 5 (6)   | 4DC.1.28.out.S |
| 1B4        | -&gt; | 5 (cfw2can)  | 7 (8)   | 4DC.1.30.out.S |
| MAIS       | -&gt; | 5 (cfw2can)  | 14      | mais.hex       |

#### **CFW2CAN2: Right arm**
| boardLabel                         |       | canDeviceNum | boardId | firmware        |
|------------------------------------|-------|--------------|---------|-----------------|
|                                    |       |              |         |                 |
| 2B0                                | -&gt; | 2 (cfw2can)  | 1       | 2BLL.1.50.out.S |
| 2B1                                | -&gt; | 2 (cfw2can)  | 2       | 2BLL.1.57.out.S |
| 2B2                                | -&gt; | 2 (cfw2can)  | 3 (4)   | 4DC.1.19.out.S  |
| virtual FT joint sensor (shoulder) | -&gt; | 2 (cfw2can)  | 12      | \- - -          |
| virtual FT joint sensor (wrist)    | -&gt; | 2 (cfw2can)  | 11      | \- - -          |
| Strain                             | -&gt; | 2 (cfw2can)  | 13      | strain.hex      |

#### **CFW2CAN6: Right hand**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 2B3        | -&gt; | 6 (cfw2can)  | 5 (6)   | 4DC.1.28.out.S |
| 2B4        | -&gt; | 6 (cfw2can)  | 7 (8)   | 4DC.1.30.out.S |
| MAIS       | -&gt; | 6 (cfw2can)  | 14      | mais.hex       |

#### **CFW2CAN3: left leg**
| boardLabel              |       | canDeviceNum | boardId | firmware        |
|-------------------------|-------|--------------|---------|-----------------|
|                         |       |              |         |                 |
| 3B5                     | -&gt; | 3 (cfw2can)  | 5       | 2BLL.1.51.out.S |
| 3B6                     | -&gt; | 3 (cfw2can)  | 6       | 2BLL.1.51.out.S |
| 3B7                     | -&gt; | 3 (cfw2can)  | 7       | 2BLL.1.51.out.S |
| virtual FT joint sensor | -&gt; | 3 (cfw2can)  | 12      | \- - -          |
| Strain                  | -&gt; | 3 (cfw2can)  | 13      | strain.hex      |

#### **CFW2CAN4: right leg**
| boardLabel              |       | canDeviceNum | boardId | firmware        |
|-------------------------|-------|--------------|---------|-----------------|
|                         |       |              |         |                 |
| 3B8                     | -&gt; | 4 (cfw2can)  | 8       | 2BLL.1.51.out.S |
| 3B9                     | -&gt; | 4 (cfw2can)  | 9       | 2BLL.1.51.out.S |
| 3B10                    | -&gt; | 4 (cfw2can)  | 10      | 2BLL.1.51.out.S |
| virtual FT joint sensor | -&gt; | 4 (cfw2can)  | 11      | \- - -          |
| Strain                  | -&gt; | 4 (cfw2can)  | 14      | strain.hex      |

#### **CFW2CAN7: Skin Left hand**
| boardLabel |       | canDeviceNum | boardId | firmware |
|------------|-------|--------------|---------|----------|
|            |       |              |         |          |
| 1B7        | -&gt; | 7 (cfw2can)  | 15      | skin.hex |
|            |       |              |         |          |

#### **CFW2CAN8: Skin Right hand**
| boardLabel |       | canDeviceNum | boardId | firmware |
|------------|-------|--------------|---------|----------|
|            |       |              |         |          |
| 2B7        | -&gt; | 8 (cfw2can)  | 15      | skin.hex |
|            |       |              |         |          |

<br />

### **iCub v1.3.0**
---
We here describe the CAN-bus networks structure of the iCub v1.3.0. The version 1.3.0 uses the CFW2 board which has 10 can-Bus lines available.

| can-bus network | configuration file    | associated robot part       |
|-----------------|-----------------------|-----------------------------|
| 0               | icub\_head\_torso.ini | head and torso              |
| 1               | icub\_left\_arm.ini   | left\_arm (joints 0 to 7)   |
| 2               | icub\_right\_arm.ini  | right\_arm (joints 0 to 7)  |
| 3               | icub\_left\_leg.ini   | left\_leg                   |
| 4               | icub\_right\_leg.ini  | right\_leg                  |
| 5               | icub\_left\_hand.ini  | left\_arm (joints 8 to 15)  |
| 6               | icub\_right\_hand.ini | right\_arm (joints 8 to 15) |
| 7               | skinlefthand.ini      | left\_hand skin             |
| 8               | skinrighthand.ini     | right\_hand skin            |                              |

Details on the control boards connected to each network are given in the following.

#### **CFW2CAN0: Head and Torso**
##### **_Head_**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 0B0        | -&gt; | 0 (pcan)     | 1 (2)   | 4DC.1.11.out.S |
| 0B1        | -&gt; | 0 (pcan)     | 3 (4)   | 4DC.1.15.out.S |


##### **_Torso_**
| boardLabel |       | canDeviceNum | boardId | firmware        |
|------------|-------|--------------|---------|-----------------|
|            |       |              |         |                 |
| 0B3        | -&gt; | 0 (pcan)     | 6       | 2BLL.1.52.out.S |
| 0B4        | -&gt; | 0 (pcan)     | 5       | 2BLL.1.54.out.S |

#### **CFW2CAN1: Left arm**
| boardLabel                         |       | canDeviceNum | boardId | firmware        |
|------------------------------------|-------|--------------|---------|-----------------|
|                                    |       |              |         |                 |
| 1B0                                | -&gt; | 1 (cfw2can)  | 1       | 2BLL.1.50.out.S |
| 1B1                                | -&gt; | 1 (cfw2can)  | 2       | 2BLL.1.57.out.S |
| 1B2                                | -&gt; | 1 (cfw2)     | 3 (4)   | 4DC.1.19.out.S  |
| virtual FT joint sensor (shoulder) | -&gt; | 1 (cfw2can)  | 12      | \- - -          |
| virtual FT joint sensor (wrist)    | -&gt; | 1 (cfw2can)  | 11      | \- - -          |
| Strain                             | -&gt; | 1 (cfw2can)  | 13      | strain.hex      |

#### **CFW2CAN5: Left hand**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 1B3        | -&gt; | 5 (cfw2can)  | 5 (6)   | 4DC.1.28.out.S |
| 1B4        | -&gt; | 5 (cfw2can)  | 7 (8)   | 4DC.1.30.out.S |
| MAIS       | -&gt; | 5 (cfw2can)  | 14      | mais.hex       |

#### **CFW2CAN2: Right arm**
| boardLabel                         |       | canDeviceNum | boardId | firmware        |
|------------------------------------|-------|--------------|---------|-----------------|
|                                    |       |              |         |                 |
| 2B0                                | -&gt; | 2 (cfw2can)  | 1       | 2BLL.1.50.out.S |
| 2B1                                | -&gt; | 2 (cfw2can)  | 2       | 2BLL.1.57.out.S |
| 2B2                                | -&gt; | 2 (cfw2can)  | 3 (4)   | 4DC.1.19.out.S  |
| virtual FT joint sensor (shoulder) | -&gt; | 2 (cfw2can)  | 12      | \- - -          |
| virtual FT joint sensor (wrist)    | -&gt; | 2 (cfw2can)  | 11      | \- - -          |
| Strain                             | -&gt; | 2 (cfw2can)  | 13      | strain.hex      |

#### **CFW2CAN6: Right hand**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 2B3        | -&gt; | 6 (cfw2can)  | 5 (6)   | 4DC.1.28.out.S |
| 2B4        | -&gt; | 6 (cfw2can)  | 7 (8)   | 4DC.1.30.out.S |
| MAIS       | -&gt; | 6 (cfw2can)  | 14      | mais.hex       |

#### **CFW2CAN3: left leg**
| boardLabel              |       | canDeviceNum | boardId | firmware        |
|-------------------------|-------|--------------|---------|-----------------|
|                         |       |              |         |                 |
| 3B5                     | -&gt; | 3 (cfw2can)  | 5       | 2BLL.1.51.out.S |
| 3B6                     | -&gt; | 3 (cfw2can)  | 6       | 2BLL.1.51.out.S |
| 3B7                     | -&gt; | 3 (cfw2can)  | 7       | 2BLL.1.51.out.S |
| virtual FT joint sensor | -&gt; | 3 (cfw2can)  | 12      | \- - -          |
| Strain                  | -&gt; | 3 (cfw2can)  | 13      | strain.hex      |

#### **CFW2CAN4: right leg**
| boardLabel              |       | canDeviceNum | boardId | firmware        |
|-------------------------|-------|--------------|---------|-----------------|
|                         |       |              |         |                 |
| 3B8                     | -&gt; | 4 (cfw2can)  | 8       | 2BLL.1.51.out.S |
| 3B9                     | -&gt; | 4 (cfw2can)  | 9       | 2BLL.1.51.out.S |
| 3B10                    | -&gt; | 4 (cfw2can)  | 10      | 2BLL.1.51.out.S |
| virtual FT joint sensor | -&gt; | 4 (cfw2can)  | 11      | \- - -          |
| Strain                  | -&gt; | 4 (cfw2can)  | 14      | strain.hex      |

#### **CFW2CAN7: Skin Left hand**
| boardLabel          |       | canDeviceNum | boardId | firmware |
|---------------------|-------|--------------|---------|----------|
|                     |       |              |         |          |
| 1B7 (HAND)          | -&gt; | 7 (cfw2can)  | 14      | skin.hex |
| 1B9 (FOREARM UPPER) | -&gt; | 7 (cfw2can)  | 13      | skin.hex |
| 1B8 (FOREARM LOWER) | -&gt; | 7 (cfw2can)  | 12      | skin.hex |
|                     |       |              |         |          |

#### **CFW2CAN8: Skin Right hand**
| boardLabel          |       | canDeviceNum | boardId | firmware |
|---------------------|-------|--------------|---------|----------|
|                     |       |              |         |          |
| 2B7 (HAND)          | -&gt; | 8 (cfw2can)  | 14      | skin.hex |
| 2B9 (FOREARM UPPER) | -&gt; | 8 (cfw2can)  | 13      | skin.hex |
| 2B8 (FOREARM LOWER) | -&gt; | 8 (cfw2can)  | 12      | skin.hex |
|                     |       |              |         |          |

<br />

### **iCub v1.x.1 ( x>1 )**
---
We here describe the CAN-bus networks structure of the iCub v1.x.1 ( x>1 ). The version 1.x.1 uses the Head V2. For CAN-bus network different from NET0 refer to relative iCub version

 can-bus network | configuration file    | associated robot part |
|-----------------|-----------------------|-----------------------|
| 0               | icub\_head\_torso.ini | head and torso        |
|                 |                       |                       |

Details on the control boards connected to network 0 are given in the following.

#### **CFW2CAN0: Head and Torso**
##### **_Head_**
| boardLabel |       | canDeviceNum | boardId | firmware          |
|------------|-------|--------------|---------|-------------------|
|            |       |              |         |                   |
| 0B0        | -&gt; | 0 (cfw2can)  | 1       | 2BLLDC.1.62.out.S |
| 0B1        | -&gt; | 0 (cfw2can)  | 2 (3)   | 4DC.2.15.out.S    |

##### **_Torso_**
| boardLabel |       | canDeviceNum | boardId | firmware        |
|------------|-------|--------------|---------|-----------------|
|            |       |              |         |                 |
| 0B3        | -&gt; | 0 (cfw2can)  | 6       | 2BLL.1.52.out.S |
| 0B4        | -&gt; | 0 (cfw2can)  | 5       | 2BLL.1.54.out.S |

<br />

### **iCub v2**
---
We here describe the CAN-bus networks structure of the iCub v2

#### **CFW2CAN0: Head and Torso**
##### **_Head_**
| boardLabel |       | canDeviceNum | boardId | firmware          |
|------------|-------|--------------|---------|-------------------|
|            |       |              |         |                   |
| 0B0        | -&gt; | 0 (cfw2can)  | 1       | 2BLLDC.1.62.out.S |
| 0B1        | -&gt; | 0 (cfw2can)  | 2 (3)   | 4DC.2.15.out.S    |

##### **_Torso_**
| boardLabel     |       | canDeviceNum | boardId | firmware        |
|----------------|-------|--------------|---------|-----------------|
|                |       |              |         |                 |
| 0B3            | -&gt; | 0 (cfw2can)  | 6       | 2BLL.2.52.out.S |
| 0B4            | -&gt; | 0 (cfw2can)  | 5       | 2BLL.2.54.out.S |
| 6SG (optional) | -&gt; | 0 (cfw2can)  | 14      | 6sg.hex         |

#### **CFW2CAN1: Left arm**
| boardLabel                         |       | canDeviceNum | boardId | firmware        |
|------------------------------------|-------|--------------|---------|-----------------|
|                                    |       |              |         |                 |
| 1B0                                | -&gt; | 1 (cfw2can)  | 1       | 2BLL.2.50.out.S |
| 1B1                                | -&gt; | 1 (cfw2can)  | 2       | 2BLL.2.57.out.S |
| 1B2                                | -&gt; | 1 (cfw2)     | 3 (4)   | 4DC.2.19.out.S  |
| virtual FT joint sensor (shoulder) | -&gt; | 1 (cfw2can)  | 12      | \- - -          |
| virtual FT joint sensor (wrist)    | -&gt; | 1 (cfw2can)  | 11      | \- - -          |
| Strain                             | -&gt; | 1 (cfw2can)  | 13      | strain.hex      |
| 6SG Shoulder (optional)            | -&gt; | 1 (cfw2can)  | 9       | 6sg.hex         |

#### **CFW2CAN5: Left hand**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 1B3        | -&gt; | 5 (cfw2can)  | 5 (6)   | 4DC.2.28.out.S |
| 1B4        | -&gt; | 5 (cfw2can)  | 7 (8)   | 4DC.2.30.out.S |
| MAIS       | -&gt; | 5 (cfw2can)  | 14      | mais.hex       |

#### **CFW2CAN2: Right arm**
| boardLabel                         |       | canDeviceNum | boardId | firmware        |
|------------------------------------|-------|--------------|---------|-----------------|
|                                    |       |              |         |                 |
| 2B0                                | -&gt; | 2 (cfw2can)  | 1       | 2BLL.2.50.out.S |
| 2B1                                | -&gt; | 2 (cfw2can)  | 2       | 2BLL.2.57.out.S |
| 2B2                                | -&gt; | 2 (cfw2can)  | 3 (4)   | 4DC.2.19.out.S  |
| virtual FT joint sensor (shoulder) | -&gt; | 2 (cfw2can)  | 12      | \- - -          |
| virtual FT joint sensor (wrist)    | -&gt; | 2 (cfw2can)  | 11      | \- - -          |
| Strain                             | -&gt; | 2 (cfw2can)  | 13      | strain.hex      |
| 6SG Shoulder (optional)            | -&gt; | 1 (cfw2can)  | 9       | 6sg.hex         |

#### **CFW2CAN6: Right hand**
| boardLabel |       | canDeviceNum | boardId | firmware       |
|------------|-------|--------------|---------|----------------|
|            |       |              |         |                |
| 2B3        | -&gt; | 6 (cfw2can)  | 5 (6)   | 4DC.1.28.out.S |
| 2B4        | -&gt; | 6 (cfw2can)  | 7 (8)   | 4DC.1.30.out.S |
| MAIS       | -&gt; | 6 (cfw2can)  | 14      | mais.hex       |

#### **CFW2CAN3: left leg**
| boardLabel               |       | canDeviceNum | boardId | firmware        |
|--------------------------|-------|--------------|---------|-----------------|
|                          |       |              |         |                 |
| 3B5                      | -&gt; | 3 (cfw2can)  | 5       | 2BLL.2.51.out.S |
| 3B6                      | -&gt; | 3 (cfw2can)  | 6       | 2BLL.2.51.out.S |
| 3B7                      | -&gt; | 3 (cfw2can)  | 7       | 2BLL.2.51.out.S |
| virtual FT joint sensor  | -&gt; | 3 (cfw2can)  | 12      | \- - -          |
| Strain                   | -&gt; | 3 (cfw2can)  | 13      | strain.hex      |
| 6SG Upper Leg (optional) | -&gt; | 3 (cfw2can)  | 1       | 6sg.hex         |
| 6SG Lower Leg (optional) | -&gt; | 3 (cfw2can)  | 2       | 6sg.hex         |

#### **CFW2CAN4: right leg**
| boardLabel               |       | canDeviceNum | boardId | firmware        |
|--------------------------|-------|--------------|---------|-----------------|
|                          |       |              |         |                 |
| 3B8                      | -&gt; | 4 (cfw2can)  | 8       | 2BLL.2.51.out.S |
| 3B9                      | -&gt; | 4 (cfw2can)  | 9       | 2BLL.2.51.out.S |
| 3B10                     | -&gt; | 4 (cfw2can)  | 10      | 2BLL.2.51.out.S |
| virtual FT joint sensor  | -&gt; | 4 (cfw2can)  | 11      | \- - -          |
| Strain                   | -&gt; | 4 (cfw2can)  | 14      | strain.hex      |
| 6SG Upper Leg (optional) | -&gt; | 4 (cfw2can)  | 1       | 6sg.hex         |
| 6SG Lower Leg (optional) | -&gt; | 4 (cfw2can)  | 2       | 6sg.hex         |

#### **CFW2CAN7: Skin Left arm**
| boardLabel                 |       | canDeviceNum | boardId | firmware |
|----------------------------|-------|--------------|---------|----------|
|                            |       |              |         |          |
| 1B7 (HAND)                 | -&gt; | 7 (cfw2can)  | 14      | skin.hex |
| 1B8 (LEFT LOWER FOREARM)   | -&gt; | 7 (cfw2can)  | 12      | skin.hex |
| 1B9 (LEFT UPPER FOREARM)   | -&gt; | 7 (cfw2can)  | 13      | skin.hex |
| 1B10 (LEFT UPPER EXTERNAL) | -&gt; | 7 (cfw2can)  | 10      | skin.hex |
| 1B11 (LEFT UPPER BOTTOM)   | -&gt; | 7 (cfw2can)  | 11      | skin.hex |
| 1B12 (LEFT UPPER INTERNAL) | -&gt; | 7 (cfw2can)  | 9       | skin.hex |
| 1B13 (LEFT LOWER UPPERARM) | -&gt; | 7 (cfw2can)  | 8       | skin.hex |
|                            |       |              |         |          |

#### **CFW2CAN8: Skin Right arm**
| boardLabel                  |       | canDeviceNum | boardId | firmware |
|-----------------------------|-------|--------------|---------|----------|
|                             |       |              |         |          |
| 2B7 (HAND)                  | -&gt; | 8 (cfw2can)  | 14      | skin.hex |
| 2B8 (LEFT LOWER FOREARM)    | -&gt; | 8 (cfw2can)  | 12      | skin.hex |
| 2B9 (LEFT UPPER FOREARM)    | -&gt; | 8 (cfw2can)  | 13      | skin.hex |
| 2B10 (RIGHT UPPER EXTERNAL) | -&gt; | 8 (cfw2can)  | 10      | skin.hex |
| 2B11 (RIGHT UPPER BOTTOM)   | -&gt; | 8 (cfw2can)  | 11      | skin.hex |
| 2B12 (RIGHT UPPER INTERNAL) | -&gt; | 8 (cfw2can)  | 9       | skin.hex |
| 2B13 (RIGHT LOWER UPPERARM) | -&gt; | 8 (cfw2can)  | 8       | skin.hex |
|                             |       |              |         |          |

#### **CFW2CAN9: Skin Torso**
| boardLabel |       | canDeviceNum | boardId | firmware |
|------------|-------|--------------|---------|----------|
|            |       |              |         |          |
| 0B7        | -&gt; | 9 (cfw2can)  | 7       | skin.hex |
| 0B8        | -&gt; | 9 (cfw2can)  | 8       | skin.hex |
| 0B9        | -&gt; | 9 (cfw2can)  | 9       | skin.hex |
| 0B10       | -&gt; | 9 (cfw2can)  | 10      | skin.hex |
|            |       |              |         |          |

### **iCub v2 - Talking Head**
We here describe the CAN-bus networks structure of the iCub v2 - Talking Head

#### **CFW2CAN0: Head and Torso**
##### **_Head_**
| boardLabel |       | canDeviceNum | boardId | firmware          |
|------------|-------|--------------|---------|-------------------|
|            |       |              |         |                   |
| 0B0        | -&gt; | 0 (cfw2can)  | 1       | 2BLLDC.1.62.out.S |
| 0B1        | -&gt; | 0 (cfw2can)  | 2 (3)   | 4DC.2.15.out.S    |
| 0B7        | -&gt; | 0 (cfw2can)  | 7 (8)   | 4DC.2.15.out.S    |
| 0B9        | -&gt; | 0 (cfw2can)  | 9 (10)  | 4DC.1.11.out.S    |

##### **_Torso_**
| boardLabel     |       | canDeviceNum | boardId | firmware        |
|----------------|-------|--------------|---------|-----------------|
|                |       |              |         |                 |
| 0B3            | -&gt; | 0 (cfw2can)  | 6       | 2BLL.2.52.out.S |
| 0B4            | -&gt; | 0 (cfw2can)  | 5       | 2BLL.2.54.out.S |
| 6SG (optional) | -&gt; | 0 (cfw2can)  | 14      | 6sg.hex         |

<br />

#### **iCub 2.5 - Wiring <= 3.2**
---
We here describe the ETH and CAN-bus firmware association structure of the iCub v2.5 (Wiring <= 3.2)

| IP address | Board Name(firmware) |  Atatched CAN Boards(firmware) | Services |
|:---:|:---:|:---:|:---:|
| 10.0.1.1 | EB1 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4<br />STRAIN(strain.hex) CAN2:13 | MC: left arm joints 0 -> 3 <br /> STRAIN |
| 10.0.1.2 | EB2 (ems.hex) | MC4(4DC.2.19.out.S) CAN1:3<br />MC4(4DC.2.28.out.S) CAN1:5<br />MC4(4DC.2.30.out.S) CAN1:7<br />MAIS(mais.hex) CAN1:14<br />MTB(mtb.hex) CAN2:8<br />MTB(mtb.hex) CAN2:9<br />MTB(mtb.hex) CAN2:10<br />MTB(mtb.hex) CAN2:11<br />MTB(mtb.hex) CAN2:12<br />MTB(mtb.hex) CAN2:13<br />MTB(mtb.hex) CAN2:14 | MC: left arm joints 4 -> 11 <br /> MAIS left hand <br /> SKIN left arm <br /> INERTIALS: left arm |
| 10.0.1.3 | EB3 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4<br />STRAIN(strain.hex) CAN2:13 | MC: right arm joints 0 -> 3<br />STRAIN | 
| 10.0.1.4 | EB4 (ems.hex) | MC4(4DC.2.19.out.S) CAN1:3<br />MC4(4DC.2.28.out.S) CAN1:5<br />MC4(4DC.2.30.out.S) CAN1:7<br />MAIS(mais.hex) CAN1:14<br />MTB(mtb.hex) CAN2:8<br />MTB(mtb.hex) CAN2:9<br />MTB(mtb.hex) CAN2:10<br />MTB(mtb.hex) CAN2:11<br />MTB(mtb.hex) CAN2:12<br />MTB(mtb.hex) CAN2:13<br />MTB(mtb.hex) CAN2:14  | MC: right arm joints 4 -> 11 <br /> MAIS right hand <br /> SKIN right arm <br /> INERTIALS: right arm |
| 10.0.1.5 | EB5 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4  | MC: torso joints 0 -> 2 |
| 10.0.1.6 | EB6 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4<br />STRAIN(strain.hex) CAN2:13 | MC: left leg joints 0 -> 3<br />STRAIN |
| 10.0.1.7 | EB7 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN2:1 | MC: left leg joints 4 -> 5<br />STRAIN |
| 10.0.1.8 | EB8 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4<br />STRAIN(strain.hex) CAN2:13 | MC: right leg joints 0 -> 3<br />STRAIN |
| 10.0.1.9 | EB9 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN2:1 | MC: right leg joints 4 -> 5<br />STRAIN |
| 10.0.1.10 | EB10 (ems.hex) | MTB(mtb.hex) CAN1:1<br />MTB(mtb.hex) CAN1:2<br />MTB(mtb.hex) CAN1:3<br />MTB(mtb.hex) CAN1:4<br />MTB(mtb.hex) CAN1:5<br />MTB(mtb.hex) CAN1:6<br />MTB(mtb.hex) CAN1:7<br />MTB(mtb.hex) CAN2:8<br />MTB(mtb.hex) CAN2:9<br />MTB(mtb.hex) CAN2:10<br />MTB(mtb.hex) CAN2:11<br />MTB(mtb.hex) CAN2:12<br />MTB(mtb.hex) CAN2:13 | SKIN: left leg<br />INERTIALS: left leg |
| 10.0.1.11 | EB11 (ems.hex) | MTB(mtb.hex) CAN1:1<br />MTB(mtb.hex) CAN1:2<br />MTB(mtb.hex) CAN1:3<br />MTB(mtb.hex) CAN1:4<br />MTB(mtb.hex) CAN1:5<br />MTB(mtb.hex) CAN1:6<br />MTB(mtb.hex) CAN1:7<br />MTB(mtb.hex) CAN2:8<br />MTB(mtb.hex) CAN2:9<br />MTB(mtb.hex) CAN2:10<br />MTB(mtb.hex) CAN2:11<br />MTB(mtb.hex) CAN2:12<br />MTB(mtb.hex) CAN2:13 | SKIN: right leg<br />INERTIALS: right leg |

<br />

#### **iCub 2.5 - Wiring > 3.2**
---
We here describe the ETH and CAN-bus firmware association structure of the iCub v2.5 (Wiring > 3.2)

| IP address | Board Name(firmware) |  Atatched CAN Boards(firmware) | Services |
|:---:|:---:|:---:|:---:|
| 10.0.1.1 | EB1 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4<br />STRAIN2(strain2.hex) CAN2:13 | MC: left arm joints 0 -> 3 <br /> STRAIN2 |
| 10.0.1.3 | EB3 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4<br />STRAIN2(strain2.hex) CAN2:13 | MC: right arm joints 0 -> 3<br />STRAIN2 | 
| 10.0.1.5 | EB5 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4 | MC: torso joints 0 -> 2 |
| 10.0.1.6 | EB6 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4<br />STRAIN2(strain2.hex) CAN2:13 | MC: left leg joints 0 -> 3<br />STRAIN2 |
| 10.0.1.7 | EB7 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN2:1<br />STRAIN2(strain2.hex) CAN2:13 | MC: left leg joints 4 -> 5<br />STRAIN2 |
| 10.0.1.8 | EB8 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN1:3<br />2FOC(2foc.hex) CAN1:4<br />STRAIN2(strain2.hex) CAN2:13 | MC: right leg joints 0 -> 3<br />STRAIN2 |
| 10.0.1.9 | EB9 (ems.hex) | 2FOC(2foc.hex) CAN1:1<br />2FOC(2foc.hex) CAN1:2<br />2FOC(2foc.hex) CAN2:1<br />STRAIN2(strain2.hex) CAN2:13 | MC: right leg joints 4 -> 5<br />STRAIN2 |
| 10.0.1.10 | EB10 (ems.hex) | MTB4(mtb4.hex) CAN1:1<br />MTB4(mtb4.hex) CAN1:2<br />MTB4(mtb4.hex) CAN1:3<br />MTB4(mtb4.hex) CAN1:4<br />MTB4(mtb4.hex) CAN1:5<br />MTB4(mtb4.hex) CAN1:6<br />MTB4(mtb4.hex) CAN1:7<br />MTB4(mtb4.hex) CAN2:8<br />MTB4(mtb4.hex) CAN2:9<br />MTB4(mtb4.hex) CAN2:10<br />MTB4(mtb4.hex) CAN2:11<br />MTB4(mtb4.hex) CAN2:12<br />MTB4(mtb4.hex) CAN2:13 | SKIN: left leg<br />INERTIALS: left leg |
| 10.0.1.11 | EB11 (ems.hex) | MTB4(mtb4.hex) CAN1:1<br />MTB4(mtb4.hex) CAN1:2<br />MTB4(mtb4.hex) CAN1:3<br />MTB4(mtb4.hex) CAN1:4<br />MTB4(mtb4.hex) CAN1:5<br />MTB4(mtb4.hex) CAN1:6<br />MTB4(mtb4.hex) CAN1:7<br />MTB4(mtb4.hex) CAN2:8<br />MTB4(mtb4.hex) CAN2:9<br />MTB4(mtb4.hex) CAN2:10<br />MTB4(mtb4.hex) CAN2:11<br />MTB4(mtb4.hex) CAN2:12<br />MTB4(mtb4.hex) CAN2:13 | SKIN: right leg<br />INERTIALS: right leg |
| 10.0.1.20 | EB20 (mc4plus.hex)<br />MC4PLUS | No CAN boards | MC: head joints 0 -> 1 |
| 10.0.1.21 | EB21 (mc4plus.hex)<br />MC4PLUS | RFE(rfe.hex) CAN1:1 | MC: head joints 2 -> 5<br />INERTIALS: head |
| 10.0.1.22 | EB22 (mc4plus.hex)<br />MC4PLUS | MTB4(mtb4.hex) CAN1:7<br />MTB4(mtb4.hex) CAN1:8<br />MTB4(mtb4.hex) CAN1:9<br />MTB4(mtb4.hex) CAN1:10 | SKIN: torso|
| 10.0.1.24 | EB24 (mc4plus.hex)<br />MC4PLUS | MTB4(mtb4.hex) CAN1:8<br />MTB4(mtb4.hex) CAN1:9<br />MTB4(mtb4.hex) CAN1:10<br />MTB4(mtb4.hex) CAN1:11<br />MTB4(mtb4.hex) CAN1:12<br />MTB4(mtb4.hex) CAN1:13<br />MTB4(mtb4.hex) CAN1:14 |  MC: left arm joints 4 -> 7 <br /> SKIN: left arm | 
| 10.0.1.25 | EB25 (mc4plus.hex)<br />MC4PLUS | MAIS(mais.hex) CAN1:14 |  MC: left arm joints 8 -> 11 | 
| 10.0.1.26 | EB26 (mc4plus.hex)<br />MC4PLUS | MAIS(mais.hex) CAN1:14 |  MC: left arm joints 12 -> 15 | 
| 10.0.1.27 | EB27 (mc4plus.hex)<br />MC4PLUS | MTB4(mtb4.hex) CAN1:8<br />MTB4(mtb4.hex) CAN1:9<br />MTB4(mtb4.hex) CAN1:10<br />MTB4(mtb4.hex) CAN1:11<br />MTB4(mtb4.hex) CAN1:12<br />MTB4(mtb4.hex) CAN1:13<br />MTB4(mtb4.hex) CAN1:14 |  MC: right arm joints 4 -> 7 <br /> SKIN: right arm | 
| 10.0.1.28 | EB28 (mc4plus.hex)<br />MC4PLUS | MAIS(mais.hex) CAN1:14 |  MC: right arm joints 8 -> 11 | 
| 10.0.1.29 | EB29 (mc4plus.hex)<br />MC4PLUS | MAIS(mais.hex) CAN1:14 |  MC: right arm joints 12 -> 15 | 