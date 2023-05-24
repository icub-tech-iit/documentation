# KIT_007 Ankle for climbing stairs




We are going to replace iCub feet plates in order to increase the step length and climb some stairs.

|       |       	          |
|   :--- |    :-----------           |
|    IIT alias (used as ordering reference)| KIT_007 |
|    Applicable to|iCub 2.x, x≥5|
|Available onboard |available as an option|


## Content material

|  Pieces |     Alias    	          |          Description                        |  Code Wgst |
|   :---: |    :-----------:            |     :---:                                   |   :---:   |
|   1   | RC_IIT_028_P_001 | left foot shaped plate | 15058 |
|   1   | RC_IIT_028_P_002 | right foot shaped plate |15059|
| 12 | V3-8--_-_U5933_C | screw 3x8 – UNI5933 –hexagon socket countersunk head |2468|

## Assembly instruction

- First of all we need to remove the sensorized sole from the foot loosening the screws in picture

| ![](img/sole.jpg) |
|:-----------------------------------------------------------: |
| the sole and its screws |



- Now we can separate the footplate and its cover loosening the screws green in picture

| ![](img/foot.jpg) |
| :-----------------------------------------------------------: |
|  the screws that tight the foot plate to the robot |


- At this point we are going to separate cover and foot plate removing these screws

    | <center> ![imagine view](img/cover.jpg) </center> |
    | :-----------------------------------------------: |
    |       how to separate foot plate from cover       |

- Now we can follow the procedure back mounting the cover on the new foot plate

    | <center> ![imagine view](img/new_foot.jpg) </center> |
    | :--------------------------------------------------: |
    |                  the new foot plate                  |

- Tight it back to the robot using the screws provided in the UKIT_007.

- Mount back the sensorized sole using the same screws as before

## Software instructions

If you mount the `KIT_007` on your iCub, the kinematics of the leg limb will change, so you will need to make sure that any model that you use in your high level software  (in particular anything related to walking or in any case motion of the legs) will be changed appropriately.

In particular, if you rely on URDF models present in https://github.com/robotology/icub-models, make sure that your iCub model is correctly updated to include the changes of `KIT_007`.

If you do not know if your iCub model is present in https://github.com/robotology/icub-models or if it is updated, feel free to open an issue on https://github.com/robotology/icub-tech-support to ask about it. 

