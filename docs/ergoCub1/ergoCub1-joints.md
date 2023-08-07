# ergoCub 1 

The technical specifications of the electro-mechanical components for the joints of ergoCub 1 are as described below: 

## Head 

### Joint 0 - neck pitch

| Joint identifier(s)  | `neck_pitch`                                         |
|:-------------------- |:---------------------------------------------------- |
| Motor                | DC Micromotor, Faulhaber 2342S012CR, OD 23           |
| Motor Encoder        | Incremental encoder IE2-512, (integrated with motor) |
| Transmission         | 1st stage - Belt drive, Reduction 28/18              |
| Speed Reducer        | Harmonic Drive HUFC-8-100-2A, Reduction 100:1        |
| Transmission         | 2nd stage - Cable drive, Reduction 31.7/30.5         | 
| Joint Encoder        | AEA board with MA730 (absolute angle encoder)        |
| Range of Motion (HW) | -45/+22 (degrees)                                    |
| Range of Motion (SW) | -40/+22 (degrees)                                    |

> PS: `neck_pitch` joint is coupled in a differential mechanism with `neck_roll`

### Joint 1 - neck roll

| Joint identifier(s)  | `neck_roll`                                          |
|:-------------------- |:---------------------------------------------------- |
| Motor                | DC Micromotor, Faulhaber 2342S012CR, OD 23           |
| Motor Encoder        | Incremental encoder IE2-512, (integrated with motor) |
| Transmission         | 1st stage - Belt drive, Reduction 28/18              |
| Speed Reducer        | Harmonic Drive HUFC-8-100-2A, Reduction 100:1        |
| Transmission         | 2nd stage - Cable drive, Reduction 31.7/30.5         | 
| Joint Encoder        | AEA board with MA730 (absolute angle encoder)        |
| Range of Motion (HW) | -20/+20 (degrees)                                    |
| Range of Motion (SW) | -20/+20 (degrees)                                    |

> PS: `neck_roll` joint is coupled in a differential mechanism with `neck_pitch`

### Joint 2 - neck yaw 

| Joint identifier(s)  | `neck_yaw`                                           |
|:-------------------- |:---------------------------------------------------- |
| Motor                | DC Micromotor, Faulhaber 2224U012SR, OD 22           |
| Motor Encoder        | Incremental encoder IE2-512, (integrated with motor) |
| Speed Reducer        | Harmonic Drive HUFC-8-100-2A, Reduction 100:1        |
| Joint Encoder        | AEA board with MA730 (absolute angle encoder)        |
| Range of Motion (HW) | -45/+45 (degrees)                                    | 
| Range of Motion (SW) | -45/+45 (degrees)                                    |

### Joint 3 - camera tilt 

| Joint identifier(s)  | `camera_tilt`                                                         |
|:-------------------- |:--------------------------------------------------------------------- |
| Motor                | DC Micromotor, Faulhaber 1524E012SR, OD 15                            |
| Motor Encoder        | Incremental encoder IE2-512, (integrated with motor)                  |
| Speed Reducer        | Spur gearhead Faulhaber 15/8, Reduction 141:1 (integrated with motor) |
| Transmission         | Linkage drive (1:1)                                                   | 
| Joint Encoder        | AEA board with MA730 (absolute angle encoder)                         |
| Range of Motion (HW) | -30/+30 (degrees)                                                     |
| Range of Motion (SW) | -30/+30 (degrees)                                                     |

---
## Arm - Upperarm, Forearm

### Joint 0 - shoulder pitch

| Joint identifier(s)  | `r_shoulder_pitch` , `l_shoulder_pitch`                                                                            |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900576, OD 49.2, ID 15.5, L 24.7, 8 pole pairs, without Hall Sensor                           |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Speed Reducer        | Harmonic Drive CSD-20-100-2UH, Reduction 100:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -170/+35 (degrees)                                                                                                 |
| Range of Motion (SW) | -130/+14 (degrees)                                                                                                 | 

### Joint 1 - shoulder roll 

| Joint identifier(s)  | `r_shoulder_roll` , `l_shoulder_roll`                                                                              |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900576, OD 49.2, ID 15.5, L 24.7, 8 pole pairs, without Hall Sensor                           |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Speed Reducer        | Harmonic Drive CSD-17-100-2A, Reduction 100:1                                                                      |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -15/+150 (degrees)                                                                                                 |
| Range of Motion (SW) | -00/+130 (degrees)                                                                                                 | 

### Joint 2 - shoulder yaw 

| Joint identifier(s)  | `r_shoulder_yaw` , `l_shoulder_yaw`                                                                                |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900575, OD 49.2, ID 15.5, L 17.7, 8 pole pairs, without Hall Sensor                           |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Speed Reducer        | Harmonic Drive CSD-17-100-2UH, Reduction 100:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -52/+82 (degrees)                                                                                                  |
| Range of Motion (SW) | -50/+80 (degrees)                                                                                                  | 

### Joint 3 - elbow 

| Joint identifier(s)  | `r_elbow` , `l_elbow`                                                                                        |
|:-------------------- |:------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900575, OD 49.2, ID 15.5, L 17.7, 8 pole pairs, without Hall Sensor                     |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26  |
| Speed Reducer        | Harmonic Drive CSD-17-100-2A, Reduction 100:1                                                                |
| Transmission         | Linkage drive (1:1)                                                                                          | 
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (MU7S), 25/32 pole pairs, OD 24.5 |
| Range of Motion (HW) | -5/+120 (degrees)                                                                                            |
| Range of Motion (SW) | -3/+105 (degrees)                                                                                            |

### Joint 4 - wrist yaw 

| Joint identifier(s)  | `r_wrist_yaw` , `l_wrist_yaw`                                                 |
|:-------------------- |:----------------------------------------------------------------------------- |
| Motor                | Brushless DC, Faulhaber 2214S024BXTH, OD 22                                   |
| Motor Encoder        | None                                                                          | 
| Speed Reducer        | Planetary Gearhead, Faulhaber 22 GPT, Reduction 196:1 (integrated with motor) |
| Transmission         | Belt drive (2:1)                                                              |
| Joint Encoder        | AEA board with MA730 (absolute angle encoder)                                 |
| Range of Motion (HW) | -92/+92 (degrees)                                                             |
| Range of Motion (SW) | -90/+90 (degrees)                                                             |

> PS: all wrist joints are coupled into a co-axial spherical parallel mechanism
### Joint 5 - wrist roll 

| Joint identifier(s)  | `r_wrist_roll` , `l_wrist_roll`                                               |
|:-------------------- |:----------------------------------------------------------------------------- |
| Motor                | Brushless DC, Faulhaber 2214S024BXTH, OD 22                                   |
| Motor Encoder        | None                                                                          | 
| Speed Reducer        | Planetary Gearhead, Faulhaber 22 GPT, Reduction 196:1 (integrated with motor) |
| Transmission         | Belt drive (2:1)                                                              |
| Joint Encoder        | AEA board with MA730 (absolute angle encoder)                                 |
| Range of Motion (HW) | -62/+52 (degrees)                                                             |
| Range of Motion (SW) | -60/+50 (degrees)                                                             |

> PS: all wrist joints are coupled into a co-axial spherical parallel mechanism

### Joint 6 - wrist pitch 

| Joint identifier(s)  | `r_wrist_pitch` , `l_wrist_pitch`                                             |
|:-------------------- |:----------------------------------------------------------------------------- |
| Motor                | Brushless DC, Faulhaber 2214S024BXTH, OD 22                                   |
| Motor Encoder        | None                                                                          | 
| Speed Reducer        | Planetary Gearhead, Faulhaber 22 GPT, Reduction 196:1 (integrated with motor) |
| Transmission         | Belt drive (2:1)                                                              |
| Joint Encoder        | AEA board with MA730 (absolute angle encoder)                                 |
| Range of Motion (HW) | -32/+32 (degrees)                                                             |
| Range of Motion (SW) | -30/+30 (degrees)                                                             |

> PS: all wrist joints are coupled into a co-axial spherical parallel mechanism

---
## Arm - Hand

### Joint 7 - thumb open & close

| Joint identifier(s)  | `r_thumb_oc` , `l_thumb_oc`                                                 |
|:-------------------- |:--------------------------------------------------------------------------- |
| Motor                | DC Micromotor, Faulhaber 1331T012SR, OD 13                                  |
| Motor Encoder        | Incremental encoder IE2-400, (integrated with motor)                        |
| Speed Reducer        | Planetary Gearhead, Faulhaber 14/1, Reduction 159:1 (integrated with motor) |
| Transmission         | Tendon drive and linkages                                                   |
| Joint Encoder        | FAP board with finger absolute position sensor                              |
| Range of Motion (HW) | +0/+90 (degrees)                                                            |
| Range of Motion (SW) | +4/+70 (degrees)                                                            | 

### Joint 8 - index finger open & close 

| Joint identifier(s)  | `r_index_oc` , `l_index_oc`                                                 |
|:-------------------- |:--------------------------------------------------------------------------- |
| Motor                | DC Micromotor, Faulhaber 1331T012SR, OD 13                                  |
| Motor Encoder        | Incremental encoder IE2-400, (integrated with motor)                        |
| Speed Reducer        | Planetary Gearhead, Faulhaber 14/1, Reduction 159:1 (integrated with motor) |
| Transmission         | Tendon drive and linkages                                                   |
| Joint Encoder        | FAP board with finger absolute position sensor                              |
| Range of Motion (HW) | +0/+90 (degrees)                                                            |
| Range of Motion (SW) | +4/+85 (degrees)                                                            | 

### Joint 9 - middle finger open & close 

| Joint identifier(s)  | `r_middle_oc` , `l_middle_oc`                                               |
|:-------------------- |:--------------------------------------------------------------------------- |
| Motor                | DC Micromotor, Faulhaber 1331T012SR, OD 13                                  |
| Motor Encoder        | Incremental encoder IE2-400, (integrated with motor)                        |
| Speed Reducer        | Planetary Gearhead, Faulhaber 14/1, Reduction 159:1 (integrated with motor) |
| Transmission         | Tendon drive and linkages                                                   |
| Joint Encoder        | FAP board with finger absolute position sensor                              |
| Range of Motion (HW) | +0/+90 (degrees)                                                            |
| Range of Motion (SW) | +4/+85 (degrees)                                                            | 

### Joint 10 - ring & pinky finger open & close

| Joint identifier(s)  | `r_ring_pinky_oc` , `l_ring_pinky_oc`                                       |
|:-------------------- |:--------------------------------------------------------------------------- |
| Motor                | DC Micromotor, Faulhaber 1331T012SR, OD 13                                  |
| Motor Encoder        | Incremental encoder IE2-400, (integrated with motor)                        |
| Speed Reducer        | Planetary Gearhead, Faulhaber 14/1, Reduction 159:1 (integrated with motor) |
| Transmission         | Tendon drive and linkages                                                   |
| Joint Encoder        | FAP board with finger absolute position sensor                              |
| Range of Motion (HW) | +0/+90 (degrees)                                                            |
| Range of Motion (SW) | +4/+85 (degrees)                                                            | 

### Joint 11 - thumb adduction/abduction 

| Joint identifier(s)  | `r_thumb_add` , `l_thumb_add`                                            |
|:-------------------- |:------------------------------------------------------------------------ |
| Motor                | DC, Maxon DCX10S EB KL 9V, OD 10                                         |
| Motor Encoder        | None                                                                     |
| Speed Reducer        | Planetary Gearhead, Maxon GPX10, Reduction 256:1 (integrated with motor) |
| Transmission         | Linkage (variable reduction)                                             | 
| Joint Encoder        | FAP board with finger absolute position sensor                           |
| Range of Motion (HW) | +0/+100 (degrees)                                                         |
| Range of Motion (SW) | +0/+85 (degrees)                                                         |

### Joint 12 - index adduction/abduction 

| Joint identifier(s)  | `r_index_add` , `l_index_add`                          |
|:-------------------- |:------------------------------------------------------ |
| Motor                | DC Gearmotor, Faulhaber 1512U012SR 324:1, OD 15        |
| Motor Encoder        | None                                                   |
| Speed Reducer        | Spur Gearhead, Reduction 324:1 (integrated with motor) |
| Transmission         | Linkages (variable reduction)                          |
| Joint Encoder        | FAP board with finger absolute position sensor         |
| Range of Motion (HW) | +6/+20 (degrees)                                       |
| Range of Motion (SW) | +7/+18 (degrees)                                       | 

---
## Torso 

### Joint 0 - torso roll 

| Joint identifier(s)  | `torso_roll`                                                                                                       |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900576, OD 49.2, ID 15.5, L 24.7, 8 pole pairs, without Hall Sensor                           |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Speed Reducer        | Harmonic Drive CSD-20-100-2UH, Reduction 100:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -25/+25 (degrees)                                                                                                  |
| Range of Motion (SW) | -23/+23 (degrees)                                                                                                  | 

### Joint 1 - torso pitch

| Joint identifier(s)  | `torso_pitch`                                                                                                      |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900576, OD 49.2, ID 15.5, L 24.7, 8 pole pairs, without Hall Sensor                           |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Speed Reducer        | Harmonic Drive CSD-20-160-2UH, Reduction 160:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -20/+65 (degrees)                                                                                                  |
| Range of Motion (SW) | -18/+45 (degrees)                                                                                                  | 

### Joint 2 - torso yaw

| Joint identifier(s)  | `torso_yaw`                                                                                                        |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900576, OD 49.2, ID 15.5, L 24.7, 8 pole pairs, without Hall Sensor                           |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Speed Reducer        | Harmonic Drive CSD-20-100-2UH, Reduction 100:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -45/+45 (degrees)                                                                                                  |
| Range of Motion (SW) | -43/+43 (degrees)                                                                                                  | 

---
## Leg

### Joint 0 - hip pitch

| Joint identifier(s)  | `r_hip_pitch` , `l_hip_pitch`                                                                                      |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900580, OD 72.4, ID 15.5, L 27.5, 12 pole pairs, without Hall Sensor                          |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Speed Reducer        | Harmonic Drive CSD-25-100-2UH, Reduction 100:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -44/+110 (degrees)                                                                                                 |
| Range of Motion (SW) | -42/+102 (degrees)                                                                                                 | 

### Joint 1 - hip roll 

| Joint identifier(s)  | `r_hip_roll` , `l_hip_roll`                                                                                        |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900576, OD 49.2, ID 15.5, L 24.7, 8 pole pairs, without Hall Sensor                           |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Transmission         | Belt drive (1:1)                                                                                                   | 
| Speed Reducer        | Harmonic Drive CSD-20-160-2UH, Reduction 160:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -35/+111 (degrees)                                                                                                 |
| Range of Motion (SW) | -15/+108 (degrees)                                                                                                 |

### Joint 2 - hip yaw

| Joint identifier(s)  | `r_hip_yaw` , `l_hip_yaw`                                                                                          |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900576, OD 49.2, ID 15.5, L 24.7, 8 pole pairs, without Hall Sensor                           |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Speed Reducer        | Harmonic Drive CSD-20-100-2UH, Reduction 100:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -81/+81 (degrees)                                                                                                  |
| Range of Motion (SW) | -78/+78 (degrees)                                                                                                  | 

### Joint 3 - knee

| Joint identifier(s)  | `r_knee` , `l_knee`                                                                                                |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900580, OD 72.4, ID 15.5, L 27.5, 12 pole pairs, without Hall Sensor                          |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Transmission         | Belt drive (1:1)                                                                                                   |
| Speed Reducer        | Harmonic Drive CSD-25-100-2UH, Reduction 100:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -105/+7 (degrees)                                                                                                  |
| Range of Motion (SW) | -103/+5 (degrees)                                                                                                  |

### Joint 4 - ankle pitch 

| Joint identifier(s)  | `r_ankle_pitch` , `l_ankle_pitch`                                                                                  |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900580, OD 72.4, ID 15.5, L 27.5, 12 pole pairs, without Hall Sensor                          |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26        |
| Transmission         | Belt drive (1:1)                                                                                                   |
| Speed Reducer        | Harmonic Drive CSD-25-100-2UH, Reduction 100:1                                                                     |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (PWB_103839), 64/63 pole pairs, OD 50.7 |
| Range of Motion (HW) | -45/+45 (degrees)                                                                                                  |
| Range of Motion (SW) | -43/+43 (degrees)                                                                                                  |

### Joint 5 - ankle roll 

| Joint identifier(s)  | `r_ankle_roll` , `l_ankle_roll`                                                                              |
|:-------------------- |:------------------------------------------------------------------------------------------------------------ |
| Motor                | Brushless DC, MOOG_C2900576, OD 49.2, ID 15.5, L 24.7, 8 pole pairs, without Hall Sensor                     |
| Motor Encoder        | LCORE5 board with AEDR-850x (reflective optical incremental encoder) + Optical Disk 004 with 900 CPR, OD 26  |
| Speed Reducer        | Harmonic Drive CSD-17-160-2A, Reduction 160:1                                                                |
| Joint Encoder        | AMO board with iC-MU (absolute magnetic off-axis encoder) + Magnetic wheel (MU7S), 25/32 pole pairs, OD 24.5 |
| Range of Motion (HW) | -25/+25 (degrees)                                                                                            |
| Range of Motion (SW) | -23/+23 (degrees)                                                                                            | 

---
