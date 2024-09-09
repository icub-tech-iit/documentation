# Sensors mounted on ergoCub

This page lists all the sensors mounted on ergoCub, and how to access their information.

## Head

|Type |Sensor Name| Device | YARP Port | Data pattern | Publish rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoard** | `head` | MC4PLUS | `/ergocub/head/state:o` | (joint_encoders) | 100 |
| - | - | - | `/ergocub/head/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100 |
|**IMU** | `head/imu` | RFE, BNO055 | `/ergocub/head/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
|**Depth Camera** | `depthCamera` | Intel Realsense D450 | `/ergocub/depthCamera/rgbImage:o` | ( (R channel)  (G channel)  (B channel) ) | 30 |
| - | - | - | `/ergocub/depthCamera/depthImage:o` | (depth_pixels_list) | 30 |
|**Lidar** | `laser` | Slamtec RP Lidar S2 | `/ergocub/laser:o` | Defined in [LaserScan2D.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_sig/src/idl/LaserScan2D.thrift#L15-L34) | 100 |

## Torso

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `torso` | EMS+2FOC | `/ergocub/torso/state:o` | (joint_encoders) | 100|
| - | - | - | `/ergocub/torso/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
| **Battery** | `battery` | BMS | `/ergocub/battery` | (voltage current charge temperature status) | 1 |
| **IMU** | `waist/inertials` | XSense MTi-600 | `/ergocub/waist/inertials/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Left Arm

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `left_arm` | EMS+2FOC, MC4PLUS, AMC+AMCBLDC | `/ergocub/left_arm/state:o` | (joint_encoders) | 100|
| - | - | - | `/ergocub/left_arm/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensor** | `left_arm/FT` | FT45 | `/ergocub/left_arm/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `left_arm/imu` | STRAIN2, BNO055 | `/ergocub/left_arm/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| - | `left_arm/inertialMTB` | MTB4, BNO055 | `/ergocub/left_arm/inertialMTB/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Right Arm

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `right_arm` | EMS+2FOC, MC4PLUS, AMC+AMCBLDC | `/ergocub/right_arm/state:o` | (joint_encoders) | 100|
| - | - | - | `/ergocub/right_arm/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensor** | `right_arm/FT` | FT45 | `/ergocub/right_arm/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `right_arm/imu` | STRAIN2, BNO055 | `/ergocub/right_arm/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| - | `right_arm/inertialMTB` | MTB4, BNO055 | `/ergocub/right_arm/inertialMTB/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Left Leg

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `left_leg` | EMS+2FOC | `/ergocub/left_leg/state:o` | (joint_encoders) | 100|
| - | - | - | `/ergocub/left_leg/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensors** | `left_leg/FT` | FT45, FT58 | `/ergocub/left_leg/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `left_leg/imu` | STRAIN2, BNO055 | `/ergocub/left_leg/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| -  | `left_foot_heel_tiptoe/imu` | STRAIN2, BNO055 | `/ergocub/left_foot_heel_tiptoe/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |

## Right Leg

|Type |Sensor name| Device | YARP Port |Data pattern | Publish Rate (Hz) |
| --- | --- | --- | --- | --- | --- |
|**ControlBoards** | `right_leg` | EMS+2FOC | `/ergocub/right_leg/state:o` | (joint_encoders) | 100|
| - | - | - | `/ergocub/right_leg/stateExt:o` | Defined in [stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift) | 100|
|**Force-Torque Sensors** | `right_leg/FT` | FT45, FT58 | `/ergocub/right_leg/FT/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) |100|
|**IMU** | `right_leg/imu` | STRAIN2, BNO055 | `/ergocub/right_leg/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
| -  | `right_foot_heel_tiptoe/imu` | STRAIN2, BNO055 | `/ergocub/right_foot_heel_tiptoe/imu/measures:o` | Defined in  [multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/messages/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift) | 100 |
