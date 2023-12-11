# Sensors mounted on iCub 2.7

This page lists all the sensors mounted on iCub 2.7, and how to access their information.

## Head

|Type |Sensor Name| Device | YARP Port | Data pattern | Publish rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoard** | `head` | MC4PLUS | `/icub/head/state:o` | (joint_encoders) | 100 |
| - | - | - | `/icub/head/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100 |
|**ControlBoard** | `face` | MC4PLUS | `/icub/face/state:o` | (joint_encoders) | 100 |
| - | - | - | `/icub/face/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100 |
|**IMU** | `head/inertials` | RFE, BNO055 | `/icub/head/inertials/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
|**Eyes cameras** | `head/cam` | Dragonfly | `/icub/head/cam/left` | ( (R channel)  (G channel)  (B channel) ) | 30 |
| - | - | - | `/icub/head/cam/right` | ( (R channel)  (G channel)  (B channel) ) | 30 |

## Torso

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `torso` | EMS+2FOC | `/icub/torso/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/torso/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**IMU** | `waist/inertials` | MTB, BNO055 | `/icub/waist/inertials/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Left Arm

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `left_arm` | EMS+2FOC, MC4PLUS | `/icub/left_arm/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/left_arm/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensor** | `left_arm/FT` | FT45 | `/icub/left_arm/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `left_arm/inertials` | STRAIN2, BNO055 | `/icub/left_arm/inertials/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
|**Skin** | `left_hand` | MAIS | `/icub/left_hand/analog:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|

## Right Arm

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `right_arm` | EMS+2FOC, MC4PLUS | `/icub/right_arm/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/right_arm/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensor** | `right_arm/FT` | FT45 | `/icub/right_arm/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `right_arm/inertials` | STRAIN2, BNO055 | `/icub/right_arm/inertials/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
|**Skin** | `right_hand` | MAIS | `/icub/right_hand/analog:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|

## Left Leg

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `left_leg` | EMS+2FOC | `/icub/left_leg/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/left_leg/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensors** | `left_leg/FT` | FT45 | `/icub/left_leg/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `left_leg/imu` |STRAIN2, BNO055 | `/icub/left_leg/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| -  | `left_foot/imu` | STRAIN2, BNO055 | `/icub/left_foot/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Right Leg

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `right_leg` | EMS+2FOC | `/icub/right_leg/state:o` | (joint_encoders) | 100|
| - | - | - | `/icub/right_leg/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensors** | `right_leg/FT` | FT45 | `/icub/right_leg/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `right_leg/imu` | STRAIN2, BNO055 | `/icub/right_leg/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| -  | `right_foot/imu` | STRAIN2, BNO055 | `/icub/right_foot/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
