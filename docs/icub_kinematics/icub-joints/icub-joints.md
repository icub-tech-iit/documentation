# **iCub Joints**

## Naming Convention
The iCub joints are organized into six sub-systems: the `head`, `left arm`, `right arm`, `torso`, `left leg`, and `right leg`.

The joints are numbered to give a natural open kinematic chain, with the base reference frame on the torso. 0 is the most proximal joint, N_max the most distal joint. The key reference point on the body is the base of the neck.

The joint numbers are used when calling methods of the motor control device interfaces. A mechanism will be available for mapping from joint identifiers to numbers. Joint identifiers are unique across the body, except for bilateral symmetry - left or right is specified separately.

## Head 1.0
| Joint number | Can Address | Identifier     | Description   | Notes                                                                                                                                             |
|--------------|-------------|----------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| 0            | 3           | neck\_pitch    | Neck pitch    | Assuming the standard definition of roll, pitch and yaw with respect to a gravity oriented reference frame aligned with the torso main dimensions |
| 1            | 3           | neck\_roll     | Neck roll     | --                                                                                                                                                |
| 2            | 3           | neck\_yaw      | Neck yaw      | --                                                                                                                                                |
| 3            | 1           | eyes\_tilt     | Eyes tilt     | Common tilt of the eyes                                                                                                                           |
| 4            | 1           | eyes\_version  | Eyes version  | Common version, the eyes move together, synchronized in the DSP controller (see also [Vergence Version](./../icub-vergence-version/icub-vergence-version\.md))                                         |
| 5            | 1           | eyes\_vergence | Eyes vergence | Vergence control, the eyes move together, synchronized in the DSP controller (see also [Vergence Version](./../icub-vergence-version/icub-vergence-version\.md))                                       |

## Head 2.0
The head has 6 joints in the standard configuration (without the facial features).

| Joint number | Can Address | Motors  | Identifier     | Description   | Notes                                                                                                                                             |
|--------------|-------------|---------|----------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| 0            | 1           | 0M0-0M1 | neck\_pitch    | Neck pitch    | Assuming the standard definition of roll, pitch and yaw with respect to a gravity oriented reference frame aligned with the torso main dimensions |
| 1            | 1           | 0M0-0M1 | neck\_roll     | Neck roll     | --                                                                                                                                                |
| 2            | 3           | 1M0     | neck\_yaw      | Neck yaw      | --                                                                                                                                                |
| 3            | 3           | 1M1     | eyes\_tilt     | Eyes tilt     | Common tilt of the eyes                                                                                                                           |
| 4            | 4           | 1M2-1M3 | eyes\_version  | Eyes version  | Common version, the eyes move together, synchronized in the DSP controller (see also [Vergence Version](./../icub-vergence-version/icub-vergence-version\.md))                                         |
| 5            | 4           | 1M2-1M3 | eyes\_vergence | Eyes vergence | Vergence control, the eyes move together, synchronized in the DSP controller (see also [Vergence Version](./../icub-vergence-version/icub-vergence-version\.md))                                       |

## Left Arm
The arm includes the hand for a total of 16 controlled degrees of freedom.

| Joint Number | Can Address | Motor       | Identifier          | Description                       | Notes                                                                                                                                               |
|--------------|-------------|-------------|---------------------|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| 0            | x           | 1B0M0       | l\_shoulder\_pitch  | Shoulder pitch                    | Front-back movement when the arm is aligned with gravity (post decoupling in firmware)                                                              |
| 1            | x           | 1B0M1       | l\_shoulder\_roll   | Shoulder roll                     | Adduction-abduction movement of the arm (post decoupling in firmware)                                                                               |
| 2            | x           | 1B1M0       | l\_shoulder\_yaw    | Shoulder yaw                      | Yaw movement when the arm principal axis is aligned with gravity (post decoupling in firmware)                                                      |
| 3            | x           | 1B1M1       | l\_elbow            | Elbow                             | --                                                                                                                                                  |
| 4            | x           | 1B2M0       | l\_wrist\_prosup    | Wrist pronosupination             | Forearm rotation along the arm principal axis                                                                                                       |
| 5            | x           | 1B2M1-1B2M2 | l\_wrist\_pitch     | Wrist pitch                       | when hand-wrist aligned with the arm principal axis: i.e. this is relative to the forearm (not necessarily to gravity). Decoupling made in firmware |
| 6            | x           | 1B2M1-1B2M2 | l\_wrist\_yaw       | Wrist yaw                         | Decoupling made in firmware                                                                                                                         |
| 7            | x           | 1B2M3       | l\_hand\_finger     | Hand finger adduction/abduction   | --                                                                                                                                                  |
| 8            | x           | 1B3M0       | l\_thumb\_oppose    | Thumb opposition                  | --                                                                                                                                                  |
| 9            | x           | 1B3M1       | l\_thumb\_proximal  | Thumb proximal flexion/extension  | Single tendon looped                                                                                                                                |
| 10           | x           | 1B3M2       | l\_thumb\_distal    | Thumb distal flexion              | Single tendon + return spring for extension spanning two physical joints                                                                            |
| 11           | x           | 1B3M3       | l\_index\_proximal  | Index proximal flexion/extension  | Single tendon looped                                                                                                                                |
| 12           | x           | 1B4M0       | l\_index\_distal    | Index distal flexion              | Single tendon + return spring for extension spanning two physical joints                                                                            |
| 13           | x           | 1B4M1       | l\_middle\_proximal | Middle proximal flexion/extension | Single tendon looped                                                                                                                                |
| 14           | x           | 1B4M2       | l\_middle\_distal   | Middle distal flexion             | Single tendon + return spring for extension spanning two physical joints                                                                            |
| 15           | x           | 1B4M3       | l\_pinky            | Ring and little finger flexion    | Single tendon + return spring spanning six joints on two fingers                                                                                    |

## Right arm
The arm includes the hand for a total of 16 controlled degrees of freedom.

to 
Markdown (GitHub-flavored)

| Joint Number | Can Address | Motor       | Identifier          | Description                       | Notes                                                                                                                                               |
|--------------|-------------|-------------|---------------------|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| 0            | x           | 2B0M0       | r\_shoulder\_pitch  | Shoulder pitch                    | Front-back movement when the arm is aligned with gravity (post decoupling in firmware)                                                              |
| 1            | x           | 2B0M1       | r\_shoulder\_roll   | Shoulder roll                     | Adduction-abduction movement of the arm (post decoupling in firmware)                                                                               |
| 2            | x           | 2B1M0       | r\_shoulder\_yaw    | Shoulder yaw                      | Yaw movement when the arm principal axis is aligned with gravity (post decoupling in firmware)                                                      |
| 3            | x           | 2B1M1       | r\_elbow            | Elbow                             | --                                                                                                                                                  |
| 4            | x           | 2B2M0       | r\_wrist\_prosup    | Wrist pronosupination             | Forearm rotation along the arm principal axis                                                                                                       |
| 5            | x           | 2B2M1-2B2M2 | r\_wrist\_pitch     | Wrist pitch                       | when hand-wrist aligned with the arm principal axis: i.e. this is relative to the forearm (not necessarily to gravity). Decoupling made in firmware |
| 6            | x           | 2B2M1-2B2M2 | r\_wrist\_yaw       | Wrist yaw                         | Decoupling made in firmware                                                                                                                         |
| 7            | x           | 2B2M3       | r\_hand\_finger     | Hand finger adduction/abduction   | --                                                                                                                                                  |
| 8            | x           | 2B3M0       | r\_thumb\_oppose    | Thumb opposition                  | --                                                                                                                                                  |
| 9            | x           | 2B3M1       | r\_thumb\_proximal  | Thumb proximal flexion/extension  | Single tendon looped                                                                                                                                |
| 10           | x           | 2B3M2       | r\_thumb\_distal    | Thumb distal flexion              | Single tendon + return spring for extension spanning two physical joints                                                                            |
| 11           | x           | 2B3M3       | r\_index\_proximal  | Index proximal flexion/extension  | Single tendon looped                                                                                                                                |
| 12           | x           | 2B4M0       | r\_index\_distal    | Index distal flexion              | Single tendon + return spring for extension spanning two physical joints                                                                            |
| 13           | x           | 2B4M1       | r\_middle\_proximal | Middle proximal flexion/extension | Single tendon looped                                                                                                                                |
| 14           | x           | 2B4M2       | r\_middle\_distal   | Middle distal flexion             | Single tendon + return spring for extension spanning two physical joints                                                                            |
| 15           | x           | 2B4M3       | r\_pinky            | Ring and little finger flexion    | Single tendon + return spring spanning six joints on two fingers      

## Torso

| Joint number | Motors      | Identifier   | Description | Notes                                                                   |
|--------------|-------------|--------------|-------------|-------------------------------------------------------------------------|
| 0            | 0B4M0       | torso\_yaw   | Torso yaw   | With respect to gravity                                                 |
| 1            | 0B3M0-0B3M1 | torso\_roll  | Torso roll  | Lateral movement (after decoupling in firmware - differential joint)    |
| 2            | 0B3M0-0B3M1 | torso\_pitch | Torso pitch | Front-back movement (after decoupling in firmware - differential joint) |

## Left leg

| Joint number | Motors | Identifier      | Description | Notes                                                                     |
|--------------|--------|-----------------|-------------|---------------------------------------------------------------------------|
| 0            | 3B6M0  | l\_hip\_pitch   | Hip pitch   | When the leg principal axis is aligned with gravity (front-back movement) |
| 1            | 3B6M1  | l\_hip\_roll    | Hip roll    | Lateral movement (when leg aligned with gravity)                          |
| 2            | 3B5M0  | l\_hip\_yaw     | Hip yaw     | Rotation along the leg/tight principal axis                               |
| 3            | 3B5M1  | l\_knee         | Knee        | --                                                                        |
| 4            | 3B7M0  | l\_ankle\_pitch | Ankle pitch | When the calf is aligned with gravity                                     |
| 5            | 3B7M1  | l\_ankle\_roll  | Ankle roll  | When the calf is aligned with gravity                                     |

## Right leg

| Joint number | Motors | Identifier      | Description | Notes                                                                     |
|--------------|--------|-----------------|-------------|---------------------------------------------------------------------------|
| 0            | 3B9M0  | r\_hip\_pitch   | Hip pitch   | When the leg principal axis is aligned with gravity (front-back movement) |
| 1            | 3B9M1  | r\_hip\_roll    | Hip roll    | Lateral movement (when leg aligned with gravity)                          |
| 2            | 3B8M0  | r\_hip\_yaw     | Hip yaw     | Rotation along the leg/tight principal axis                               |
| 3            | 3B8M1  | r\_knee         | Knee        | --                                                                        |
| 4            | 3B10M0 | r\_ankle\_pitch | Ankle pitch | When the calf is aligned with gravity                                     |
| 5            | 3B10M1 | r\_ankle\_roll  | Ankle roll  | When the calf is aligned with gravity    

## Device and Port view
The iCub user will be able to control all joints as they wish, if they wish. For each sub-system, the programmer will be able to retrieve the [control interfaces](http://yarp.it/git-master/group__dev__iface__motor.html) they need.

We expect that these control interfaces will normally be accessed remotely, for all but the tightest control loops. There will be three ports per control group. For example, the head group will have three ports named as follows:

| port name            | purpose                       |
|----------------------|-------------------------------|
| /icub/head/rpc:i     | commands that require replies |
| /icub/head/command:i | streaming commands            |
| /icub/head/state:o   | motor state information       |

A user can see the commands that the `rpc:i` port supports by using `yarp rpc` to send it the message `help`, or browsing to it via the address reported by `yarp where` and clicking `help`. For example, typing:

```xml 
yarp rpc /icub/head/rpc:i
```
followed by:
```xml
[set] [pos] 0 45
```
will command axis 0 of the head (neck_pitch) to 45 degrees. If no motion is seen, it may be necessary to `enable` the axis:
```xml
 [set] [aen] 0
```
 where `aen` means `axis enable`. The braces are optional. Of course, there are APIs for all such operations.

Here are the identifiers used in port names for the different control groups:

| Part  | Side  | Identifier |
|-------|-------|------------|
| head  | --    | head       |
| arm   | left  | left\_arm  |
| arm   | right | right\_arm |
| torso | --    | torso      |
| leg   | left  | left\_leg  |
| leg   | right | right\_leg |

## Units
All angles are given in DEGREES.