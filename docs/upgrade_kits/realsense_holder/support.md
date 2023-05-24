# KIT_008 iCub RealSense holder

## Upgrade Kit
This upgrade kit is meant to improve iCub's 3D perception and grasping capabilities by adding a RealSense camera plugged on the head, in addition to the other eye cameras.

It ensures the compatibility with more RealSense models.

|  |  |  |
| :---: | :---: | :---: |
| <img src="../img/11.PNG"> | <img src="../img/8.PNG"> | <img src="../img/9.PNG"> |

|  |  |
| :--- | :--- |
|  IIT alias (used as ordering reference) | KIT_008  |
|  IIT Code  | 17314 |
|    Applicable to|iCub 2.7 | 
|Available onboard |no, optional|

|  #  |     Code   |   Alias  |  Rev | UM |  Qty  |  Description |
|   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |
| 1 |  15363  | MKIT_008  | A1  | Pieces  |  1  |iCub 2.7, head, RealSense holder |

## Content material  MKIT_008

|  Pieces |     Alias        | Rev.|  Description       |  Cod. Wgst |
|   :---: |    :-----------: |:---:|     :------------: |   :---:   |
|    1   |	IG_027_P_010  |  |iCub Head, RealSense setup, holder | 	17315 |
|    2   |	V3-8--_-_U5933_C  |   | screw – M 3 x 8 – UNI5933 , DIN7991  , ISO10642 – SS A2 – hexagon socket countersunk head  | 2468 |
|     2  | V4-16--_-_ISO7045_CZ|   | screw - M4 x 16 - UNI7687 , DIN7985A , ISO7045 - SS A2 - pozidriv cross recessed pan head |11963|

## Historical review
This upgrade kit has been developed together with the [HSP@IIT](https://www.iit.it/web/humanoid-sensing-and-perception) research line as an optional plug-in support to improve iCub perception and facilitate it in grasping tasks iCub. For reference, see also the page [design holder realsense](https://github.com/icub-tech-iit/design-holder-realsense).

<center> <img src="../img/1.PNG" height=400> </center>

The holder has been designed to be compatible with the following RealSense models:

|     Alias        |  Description       |  Cod. Wgst |
|    :-----------: |     :------------: |   :---:   |
|	INTEL_REALSENSE_D415   |Intel Realsense D415, range from 0.3 to 10m, FOV 70 de | 	13038 |
|	INTEL_REALSENSE_D435i | 	Intel Realsense D435i with IMU, range from 0.2 to 10m, FOV 90 de i  | 14567 |
|	INTEL_REALSENSE_D405 | 	Intel RealSense D405 with IMU, range from 7 cm to 50 cm, FOV 87°×58°  | 17231 |

!!! note "Note"
    Not all the RealSense cameras have the same interface, some of them connect by using a different cable.

|     RealSense model        |  associated cable      | Cable Wgst Code |
|    :-----------: |     :------------: |   :---:   |
|	INTEL_REALSENSE_D415   |USB Shielded I/O Cable Assembly, Type C/M to C/M, USB 3.1 GEN4, 3.0m Length, Black | 	15365 |
|	INTEL_REALSENSE_D435i   |USB Shielded I/O Cable Assembly, Type C/M to C/M, USB 3.1 GEN4, 3.0m Length, Black | 	15365 |
|	INTEL_REALSENSE_D405   |USB Shielded I/O Cable Assembly, USB 3.2 Gen 1, Male A to Male Micro-B, 3.0m length, black | 17308 |

## Assembly instruction
The RealSense holder can be mounted on the top of iCub head by replacing two side screws fixing the face cover, and in the kit are included and USB Type-C cable, screws and cable ties. The kit does NOT include the RealSense. It is recommended to replace the short cable included in the RealSense retail package with the longer one provided with the upgrade kit.

!!! note "Note"

    The following instructions are provided for assembling the D435i model of RealSense camera.

<center> <img src="../img/6.PNG" height=400> </center>

**Assembly sequence**

*Perform the assembly sequence as shown in the following images.*

- First step, remove the two screws V4-12--_-_U5933_C from the side of the face cover as can be seen in the image. Set them aside, just in case you want to successively unmount the RealSense holder.

<center> <img src="../img/2.PNG" height=400> </center>

- Second step, fix the holder IG_027_P_010 with the respective screws V4-16--_-_ISO7045_CZ as shown in the image, and fix the hook to the backward cover air vents.

<center> <img src="../img/3.PNG" height=400> </center>

- Third step, fix the chosen RealSense model to the holder usign the screws V3-8--_-_U5933_C. At this point is possible to plug the USB Type-C cable cod. 15365 and use the cable ties cod. 531 to fix it around the head.

<center> <img src="../img/4.PNG" height=400> </center>
<center> <img src="../img/5.PNG" height=500> </center>

!!! note  "Note" 

    As mentioned above, the RealSense D405 uses a different cable too.

## Print the RealSense Holder yourself
Check out the [STL and STEP files](https://github.com/icub-tech-iit/documentation/raw/master/docs/upgrade_kits/realsense_holder/assets/realsense_holder.zip) of the holder. 

## Calibration of the RealSense Holder
The software tool used to estimate the extrinsic parameters of the RealSense camera when mounted with the holder with respect to the robot known frames is [`realsense-holder-calibration`](https://github.com/robotology/realsense-holder-calibration).

Find therein the relative documentation.
