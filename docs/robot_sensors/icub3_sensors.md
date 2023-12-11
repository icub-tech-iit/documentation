# Sensors mounted on iCub 3

This page lists all the sensors mounted on iCub 3, and how to access their information.

## Head

|Type |Sensor Name| Device | YARP Port | Data pattern | Publish rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoard** | `head` | MC4PLUS | `/icub/head/state:o` | (joint_encoders) | 100 |
| - | - | - | `/icub/head/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100 |
|**IMU** | `head/imu` | RFE, BNO055 | `/icub/head/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
|**Eyes cameras** | `head/cam` | Basler daA4200-30mci | `/icub/head/cam/left` | ( (R channel)  (G channel)  (B channel) ) | 30 |
| - | - | - | `/icub/head/cam/right` | ( (R channel)  (G channel)  (B channel) ) | 30 |

## Torso

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `torso` | EMS+2FOC | `/icub/torso/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/torso/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
| **Battery** | `batttery` | BMS | `/icub/battery` | | 1 |

## Left Arm

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `left_arm` | EMS+2FOC, MC4PLUS | `/icub/left_arm/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/left_arm/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensor** | `left_arm/FT` | FT45 | `/icub/left_arm/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `left_arm/imu` | STRAIN2, BNO055 | `/icub/left_arm/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| - | `left_arm/inertialMTB` | MTB4, BNO055 | `/icub/left_arm/inertialMTB/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Right Arm

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `right_arm` | EMS+2FOC, MC4PLUS | `/icub/right_arm/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/right_arm/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensor** | `right_arm/FT` | FT45 | `/icub/right_arm/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `right_arm/imu` | STRAIN2, BNO055 | `/icub/right_arm/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| - | `right_arm/inertialMTB` | MTB4, BNO055 | `/icub/right_arm/inertialMTB/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Left Leg

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `left_leg` | EMS+2FOC | `/icub/left_leg/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/left_leg/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensors** | `left_leg/FT` | FT45, FT58 | `/icub/left_leg/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `left_leg/imu` | STRAIN2, BNO055 | `/icub/left_leg/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| -  | `left_foot_heel_tiptoe/imu` | STRAIN2, BNO055 | `/icub/left_foot_heel_tiptoe/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Right Leg

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `right_leg` | EMS+2FOC | `/icub/right_leg/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/right_leg/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensors** | `right_leg/FT` | FT45, FT58 | `/icub/right_leg/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `right_leg/imu` | STRAIN2, BNO055 | `/icub/right_leg/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| -  | `right_foot_heel_tiptoe/imu` | STRAIN2, BNO055 | `/icub/right_foot_heel_tiptoe/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
