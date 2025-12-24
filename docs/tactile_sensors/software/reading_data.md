# Reading Raw Tactile Data
Each sensor outputs an integer value in `[0 255]`: the lower the value, the higher the pressure.
The output value with zero pressure may vary with the version of the firmware, but it is typically `235`.

Tactile sensor data are provided to the user through YARP ports streaming YARP vectors. In particular, these are the available ports:

- `/icub/skin/left_hand` (1 patch)
- `/icub/skin/left_forearm` (2 patches)
- `/icub/skin/left_arm` (4 patches)
- `/icub/skin/right_hand` (1 patch)
- `/icub/skin/right_forearm` (2 patches)
- `/icub/skin/right_arm` (4 patches)
- `/icub/skin/torso` (4 patches)

Taking a look at the number of ports (i.e. 7) and the number of patches (i.e. 18), it is clear that some ports correspond to more than one patch. Consequently, the sizes of the output vectors of the ports are different.

Given that each patch is composed by at most 16 triangles, each containing 12 sensors, each patch can have at most 192 sensors. Hence, each port outputs 192 values for each patch. However, since some patches do not contain 16 triangles (e.g. hand, upper forearm, top upper arm), some of the port output values are always zero – see this [section](#reading-compensated-tactile-data).

# Reading Compensated Tactile Data
For most applications, raw sensor data need some filtering before being used.

The software module [**`skinManager`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__skinManager.html) takes care of:

1. compensating for the thermal drift affecting the sensors.
2. filtering high frequency noise.

The filtered tactile data can be read from YARP ports (similarly to the raw data):

- `/icub/skin/left_hand_comp`
- `/icub/skin/left_forearm_comp`
- `/icub/skin/left_arm_comp`
- `/icub/skin/right_hand_comp`
- `/icub/skin/right_forearm_comp`
- `/icub/skin/right_arm_comp`
- `/icub/skin/torso_comp`

Differently from the raw data, these values are floating point numbers in `[0 255]`, where `0` means no pressure.

One can read the output of the skin ports on the terminal using the following command:

```console
$ yarp read ... port_name
```

Each port outputs a vector of floating point numbers, with output from individual taxels and is zero padded in certain positions.
The size of the vector depends on the skin part, in particular it is:

- 192 for hand data, where 1-60 are taxels of fingertips (12 each in this order: index, middle, ring, little, thumb);
- 61-96 zeros;
- 97-144 palm taxels (inside these, 108, 120, 132, and 140 are thermal pads ~ `0`s);
- 145-192 zeros.

With the exception of the palm and finger data, the skin is composed of triangular modules with 10 taxels each. However, there are 12 positions reserved for each module in the port output. The 7th and 11th values are not meaningful as tactile output (signal from thermal pads) and can be ignored.

- 2 * 192 = 384 for forearm data, where the first 192 values correspond to a full patch – bottom of forearm. They are 16 consecutive modules. Then, there is the other incomplete patch with only 7 modules (skin V1) / 8 modules (skin V2) at the top of the forearm.
    - V1: the positions 193-204; 217-252; 265-288; 325-336; 361-384 are empty.
    - V2: the positions 217-228; 241-264; 277-288; 313-336; 361-384 are empty.
- 4 * 192 = 768 for (upper) arm data and torso.

!!! warning "Index base"
    We referred to the "_positions_" on the port starting from `1`. However, if you use `taxelIDs` from the `skinDynLin` library, positions start from `0`.
    Example: taxel ID 10 would be the 11th on the port. This is also used in the `skin_events` output – see this [section](#reading-high-level-contact-data).

# Taxels Coordinates
For every skin part, the coordinates of every taxel in local link reference frames can be retrieved from [**`icub-main/app/skinGui/conf/positions`**](https://github.com/robotology/icub-main/tree/master/app/skinGui/conf/positions).

The first three columns are x,y,z coordinates. The default output rate is `50` Hz.

# Reading High Level Contact Data
The software module [**`skinManager`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__skinManager.html) provides a high-level representation of the tactile data, under the form of a [**`skinContactList`**](https://robotology.github.io/robotology-documentation/doc/html/classiCub_1_1skinDynLib_1_1skinContactList.html). A `skinContactList` is a list of [**`skinContact`**](https://robotology.github.io/robotology-documentation/doc/html/classiCub_1_1skinDynLib_1_1skinContact.html). Note that in case multiple tactile sensors are activated by a contact, the `skinManager` groups them together into a unique `skinContact`.

The port on which the skinContactList is written is:

- `/skinManager/skin_events:o`

Every `skinContactList` is represented with the following format:

- `(SKIN_CONTACT_VECTOR_1) ... (SKIN_CONTACT_VECTOR_N)`.

There are as many `SKIN_CONTACT_VECTOR`s as there were (clusters of) contacts detected on the whole skin of the robot by the `skinManager`.

In case of no contact, the `skinContactList` is empty.

If there was contact, every `SKIN_CONTACT_VECTOR` is enclosed by brackets and has the following format:

- `((contactId bodyPartId linkNumber skinPart) (centerOfPressure_x cOP_y cOP_z) (force_x f_y f_z) (moment_x m_y m_z) (geometricCenter_x gC_y gC_z) (surfaceNormalDirection_x sND_y sND_z) (activatedTaxelId1 aTId2 .. aTIdN) average_pressure)`.

Here more information on some of the data:

- `bodyPart`, the part of the body:
    - `TORSO=1`
    - `HEAD=2`
    - `LEFT_ARM=3`
    - `RIGHT_ARM=4`
    - `LEFT_LEG=5`
    - `RIGHT_LEG=6`
- `linkNumber`, the link number relative to the specified body part (e.g., `upper arm=2`, `forearm=4`, `hand=6`)
- `skinPart`, the part of the skin:
    - `SKIN_LEFT_HAND=1`
    - `SKIN_LEFT_FOREARM=2`
    - `SKIN_LEFT_UPPER_ARM=3`
    - `SKIN_RIGHT_HAND=4`
    - `SKIN_RIGHT_FOREARM=5`
    - `SKIN_RIGHT_UPPER_ARM=6`
    - `SKIN_FRONT_TORSO=7`
- `CoP`, the center of pressure (expressed in link reference frame)
- `force`, force applied at contact (expressed in link reference frame)
- `moment`, moment applied at contact (expressed in link reference frame)
- `geoCenter`, the geometric center of the contact area (expressed in link reference frame)
- `normalDir`, normal direction of the contact area (expressed in link reference frame)
- `taxelList`, list of ids of the activated taxels
- `pressure`, average output of the activated taxels
