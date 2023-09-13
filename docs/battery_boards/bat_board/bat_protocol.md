# BAT board Protocol

## Introduction
This page describes the `BAT` board and its protocol. Basically, this board is responsible for the management of the data and signals provided by the battery pack in `R1`, `iCub`, and `ergoCub` robots. Moreover, it should be noted that in these robots it is always coupled with the `BMS` baord, which is responsible for fine-tuning and managing the battery pack status.
In general, as shown in the figures below (illustrating the connection between the BAT and EMS boards in the base of `R1/SN003`), the `BAT` can be connected to an EMS board through the `CAN` connector devoted to receiving the CAN frames sent out by the `BAT`.

<center>
<table><tr>
<td><img width="500" height="500" src="../assets/bat-2-ems-R1-connection-01.png"/></td>
<td><img width="500" height="500" src="../assets/bat-2-ems-R1-connection-02.png"/></td>
</tr></table>
</center>

Specifically, at the current status of the development (July 2023), the `BAT` board can send the following data:

- Battery Pack Voltage in Volt.
- Battery Pack Charge in $\%$.
- Battery Pack Status (detail will follow).


### Communication characteristics

The pieces of information detailed above are sent by the `BAT` board with a FIFO cycle of 1 ms. Then, the `EMS` board handles the CAN frames sent by the `BAT`, parses them, and finally forwards them to the higher level of the `yarprobotinterface` at the specific port defined in the configuration files with a frequency of 1 Hz.
Furthermore, that info is also sent directly from the `BAT` to the display attached to the robot, every 10 ms.

### Types of data transmitted

As mentioned at the end of the [introduction section](#introduction), the CAN frames sent by the `BAT` to the `EMS` and parsed by this latter board are:

- Battery pack info message sent at address `0x620` as:

    | Byte | Value | Description | 
    |:---:|:---:|:---|
    | 0 | Vbattery & 0xFF        | LSBs of the battery pack voltage |
    | 1 | (Vbattery >> 8) & 0xFF | MSBs of the battery pack voltage |
    | 2 | 0x00                   | Not used   |
    | 3 | 0x00                   | Not used   |
    | 4 | battery_charge & 0xFF  | byte of the battery pack charge |
    | 5 | 0x00                   | Not used |
    | 6 | 0x00                   | Not used |
    | 7 | 0x00                   | Not used |
    
- Battery pack status message sent at address `0x629` as:

    | Byte | Value | Description | 
    |:---:|:---:|:---|
    | 0 | DCDC_status_A & 0xFF | DCDC status A |
    | 1 | DCDC_status_B & 0xFF | DCDC status A |
    | 2 | 0x00                 | Not used   |
    | 3 | 0x00                 | Not used   |
    | 4 | 0x00                 | Not used   |
    | 5 | 0x00                 | Not used   |
    | 6 | 0x00                 | Not used   |
    | 7 | 0x00                 | Not used   |

where:

- DCDC_status_A (bits are summed up together):

    Position | BIT[7] | BIT[6] | BIT[5] | BIT[4] | BIT[3] | BIT[2] | BIT[1] | BIT[0] |
    |:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
    Value | V12board | V12board_F | V12motor | V12motor_F | HSM | HSM_PG | HSM_F | HSM_broken |
    Description | 12V DCDC board regulator | 12V DCDC board regulator OVERCURRENT fault | 12V DCDC motor regulator | 12V DCDC motor regulator OVERCURRENT fault | Hot Swap Manager | Hot Swap Manager POWER GOOD | Hot Swap Manager OVERCURRENT/OVERVOLTAGE fault | Hot Swap Manager MOSFETs damaged |
    Possible status | ON(1)/OFF(0) | OC/NORMAL | ON/OFF | OC/NORMAL| ON/OFF | HSM output voltage stable after transient/HSM output voltage not guaranteed | OC-OV/NORMAL | HSM MOSFETs probably burned/NORMAL |

- DCDC_status_B:

    Position | BIT[1] | BIT[0] |
    |:---|:---:|:---:|
    Value | PB1_restart | PB2_restart |
    Description | Restart phase of the push button 1 | Restart phase of the push button 2 |
    Possible status | Start-up phase(1)/stable operation(0) | Start-up phase/stable operation |

- Final status shown at the port is equal to: 

    `(DCDC_status_B << 8 ) | DCDC_status_A`


### Data displayed on the yarp port

The user gets the data from a specific YARP port defined in the configuration file. Here's the format:

- Voltage is displayed in the Volts.
- Battery charge is displayed in $\%$.
- Status is displayed as a 16-bit integer (only the first 10 bits are valid), whose mapping adheres to the tables above.

Moreover, at start-up, a **DEBUG** message with the initial values of the status (converted to the description strings) is sent to `yarprobotinterface`. 
Then, each time the status changes, a **DEBUG** message is sent to `yarprobotinterface`, which in turn prints out a description only about the values of those bits that have switched.
