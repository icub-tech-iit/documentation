# BMS board

## Introduction

The Battery Management System (`BMS`) is the board responsible for the correct functioning of the battery pack. Thereby, it prevents the battery from operating outside its safe boundaries, while monitoring its state, and reporting meaningful data to the end user.

The `BMS` is connected to an `EMS` board through the `CAN` connector devoted to receiving the CAN frames sent out by the `BMS` itself. The figures below illustrate the CAN connection between the `BMS` and `EMS` boards on the ergoCub robot platform.

<center>
<table><tr>
<td><img width="500" height="500" src="../assets/bms-2-ems-ergoCub-connection.png"/></td>
<td><img width="500" height="500" src="../assets/ems-2-bms-ergoCub-connection.png"/></td>
</tr></table>
</center>

## Output data

The BMS provides the battery pack information, such as `voltage`, `current`, `state of charge`, `average temperature`, and `error flags`. 
Specifically, the `BMS` board can send the following data (which is then elaborated by fw and sw and sent to a `yarp` port):

- **Battery-Pack Voltage in Volt**. This is the `Battery pack` voltage.
- **Total Battery-Pack Current**. This is the total current, with sign, flowing outwards or inwards to the battery pack. Current has a **negative** sign if going out from the battery pack towards the robot and a **positive** sign otherwise, for example when the batteries get charged.
- **Battery Pack Charge in $\%$**. This has a value different from `NaN` if the robot has the `Battery pack` switch enabled.
- **Battery-Pack Temperature in $^\circ C$**. Differently from the `BAT` board, this field is available for `BMS` and it is the **average temperature** of the battery pack.
- **Battery-Pack Status**. Currently, it is a bitmask corresponding to the error flags that can be risen by the `BMS`. Please see the [Types of data transmitted](#types-of-data-transmitted) for the `BMS_STATUS` meanings.

### Communication characteristics

The `BMS` board sends the pieces of information detailed above in polling with a frequency of `1 Hz`. Then, the `EMS` board handles the CAN frames sent by the `BAT`, parses them, and finally forwards them to the higher level of the `yarprobotinterface` at the specific port defined in the configuration files with a default frequency of `1 Hz`.

### Types of data transmitted

Referring to the current `CAN` protocol of the `BMS`, the frames that the  `EMS` manages are the following:

- Battery pack info message sent at address `0x620` as:
  
    | Bytes | Value | Description | 
    |:---:|:---:|:---|
    | 0-1 | Battery-pack voltage in deciVolt | battery pack voltage as unsigned short int |
    | 2-3 | Instantaneous Current in deciAmpere | battery pack instantaneous current as short int |
    | 4-5 | State of Charge in %  | battery pack state of charge as unsigned short int |
    | 6-7 | Average Temperature in Celsius | batter pack average temperature as unsigned short int |

- Battery pack status message sent at address `0x628` in the byte0 as:

    | Bit | Value | Description | 
    |:---:|:---:|:---|
    | 0 | [0 - 1] | battery pack low voltage error |
    | 1 | [0 - 1] | battery pack high voltage error |
    | 2 | [0 - 1] | battery pack overcurrent in discharge |
    | 3 | [0 - 1] | battery pack overcurrent in charge |
    | 4 | [0 - 1] | battery pack low state of charge |
    | 5 | [0 - 1] | battery pack low temperature |
    | 6 | [0 - 1] | battery pack high temperature |

!!! note
    Specifically to this message, only the `general alarm status` of the battery pack is sent out, stored at `byte 0`. This identifies the single or multiple causes that trigger the alarm status on `BMS`. Note that, if an alarm is raised, it remains engaged for **1 minute**, even if the alarm is cleared.

### Data displayed on the YARP port

The user gets the data from the specific YARP port defined in the configuration file (e.g., on the ergoCub robot it is `/ergocub/battery/bms/data:o`). Here's the format:

- **Battery-Pack Voltage**, which is displayed in $Volt [V]$.
- **Instantaneous current**, flowing inwards/outwards the battery pack, which is displayed in $Ampere [A]$.
- **Battery-Pack state of charge**, which is displayed in $\%$.
- **Average Temperature** of the battery pack, which is displayed in $^\circ C$.
- **Battery-Pack Status** is displayed as a 16-bit integer (only the first 7 bits are valid), whose mapping adheres to the tables above.

Moreover, at start-up, a **DEBUG** message with the initial values of the status (converted to the description strings defined in the static array `s_boards_map_of_battery_alarm_status` in `embObjBattery::updateStatusStringStream()` method) is sent to `yarprobotinterface`. 
Then, each time the status changes, a **DEBUG** message is sent to `yarprobotinterface`, which in turn prints out a description only about the values of those bits that have switched.