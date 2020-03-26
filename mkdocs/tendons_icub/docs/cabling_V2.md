# LOWER ARM V2 CABLING

## CAD DESIGN

> Let's have an overview of the mechanical CAD from different view angles and their specific names on CAD assembly.

| Left Forearm V2                                              | Right Forearm V2                                             |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src ="/../GIF/lower_arm/L-4RM-V2.gif" height = 600px>   | <img src ="/../GIF/lower_arm/R-4RM-V2.gif" height = 600px>   |
| in **CAD** repository (maybe CREO): RC_TLR_007_A_001_LEFT_FOREARM.ASM + RC_TLR_012_A_001_LEFT_HAND.ASM | in **CAD** repository (maybe CREO): RC_TLR_010_A_001_RIGHT_FOREARM.ASM + RC_TLR_011_A_001_RIGHT_HAND.ASM |

## 1.	WHAT DO I NEED TO CABLE

Here you will find the overall tables describing the necessary parts needed when routing the cables onto the 11 motors (12 motors inside the Lower Arm but just 11 are cabled) and the mandatory sheaths to be used in the correct place.

### 1.1	Finger sheaths

| IITCODE | Alias                         | Description                                                  |
| ------- | ----------------------------- | ------------------------------------------------------------ |
| 2375    | SHEATH                        | Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm, L = 500 mm |
| 13963   | MAZZONI_0_3-0_8-250_SS_SHEATH | Rectangular section sheath 0.3x0.8, L = 250 mm               |
| 2386    | TEFLON_SHEATH                 | Insulating sheath, AWG22, inner dia 0,709 -0/+0,102 mm, material thickness 0,152 -0/+0,102mm, Teflon, transparent |

!!!DANGER
    inside sheath 13963 please **DO NOT (NEVER) USE** Teflon sheath!!!

#### 1.1.a	Sheaths length & labelling 

Please refer to this table to find out which sheath you need to install at the right place and the correct label to add on top of it:

| Finger  | Typology     | Label       | Length (mm) | IITCODE - sheath  |
| ------- | ------------ | ----------- | ----------- | ----------------- |
| Thumb   | Proximal     | 6+          | 185         | 13963             |
| Thumb   | Proximal     | 6-          | 185         | 13963             |
| Thumb   | Short Prox + | pict. above | 9           | 2375              |
| Thumb   | Short Prox - | pict. above | 11          | 2375              |
| Thumb   | Distal       | N4          | 57          | 2375  `(+Teflon)` |
| Thumb   | Short Dist   | pict. above | 11.5        | 2375              |
| Thumb   | oppose       | S0          | 50          | 13963             |
| Thumb   | oppose       | S2          | 57          | 13963             |
| Index   | Proximal     | 8+          | 224         | 13963             |
| Index   | Proximal     | 8-          | 224         | 13963             |
| Index   | Distal       | N5          | 105         | 2375  `(+Teflon)` |
| Middle  | Proximal     | 7+          | 224         | 13963             |
| Middle  | Proximal     | 7-          | 224         | 13963             |
| Middle  | Distal       | N3          | 105         | 2375  `(+Teflon)` |
| Ring    | Distal       | N2          | 95          | 2375  `(+Teflon)` |
| Pinkie  | Distal       | N9          | 95          | 2375  `(+Teflon)` |
| Fingers | abduct       | T0          | 90 (1)      | 2375              |
| Fingers | abduct       | T2          | 27          | 2375              |
| Fingers | abduct       | T4          | 44          | 2375              |

`(+Teflon) refers to the IITCODE 2386`



!!! NOTE
    (1) the length 90 mm of T0 comes from the previous version where there was: T0+T3+tensioner (38+38+14 mm).

!!! WARNING
    For the proximal sheath, please label BOTH the start of the sheath (base of the motor at the level of the elbow) and at the end of it.

### 1.2   Finger & hand cables

| IITCODE | Alias    | Description                                                  |
| ------- | -------- | ------------------------------------------------------------ |
| 1815    | CG077063 | Stainless steel microcable, cable construction 7x7mm, nom. dia 0,63mm, not coated, AISI 316 |
| 2391    | U7194561 | Stainless steel microcable, cable construction 7x19mm, nom. dia 0.45mm, outer dia 0.61mm, Polyamide coated, AISI 316 - CARL STAHL GMBH |

#### 1.2.a Cables length

Please refer to this table to find out which cable you need to install at the right place:

| Finger  | Typology  | Length (cm) | IITCODE - cable |
| ------- | --------- | ----------- | --------------- |
| Thumb   | oppose    | 50          | 1815            |
| Thumb   | Proximal  | 100         | 1815            |
| Index   | Proximal  | 100         | 1815            |
| Middle  | Proximal  | 100         | 1815            |
| Thumb   | Distal    | 40          | 2391            |
| Index   | Distal    | 40          | 2391            |
| Middle  | Distal    | 40          | 2391            |
| Ring    | Distal    | 40          | 2391            |
| Pinkie  | Distal    | 40          | 2391            |
| Fingers | Abduction | 50          | 1815            |

## 2. HOW TO CABLE - FINGERS & HAND

### 2.1	Proximal joints

The 3 proximal joints : 

- Thumb
- Index
- Middle

located here:

| LEFT FOREARM                                                 | RIGHT FOREARM                                                |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src ="/../img/lowerArm/L_4RM_Prox_Pos.png" height=auto width=700> | <img src ="/../img/lowerArm/R_4RM_Prox_Pos.png" height=auto width=700> |
| <img src ="/../img/lowerArm/L4RM-ElbowView.png" height=auto width=400> | <img src ="/../img/lowerArm/R4RM-ElbowView.png" height=auto width=400> |

are all wired with the cable 0.63mm uncoated from CARLSTAHL GmbH as per the following table:

| IITCODE | Alias    | Description  |
| ------- | -------- | ------------ |
| 1815    | CG077063 | Stainless steel microcable, cable construction 7x7mm, nom. dia 0,63mm, not coated, AISI 316 |

Every sheath in which the cable pass through (+ and - ) is made of:

| IITCODE | Alias                         | Description |
| ------- | ----------------------------- | ----------- |
| 13963   | MAZZONI_0_3-0_8-250_SS_SHEATH | Rectangular section sheath 0.3x0.8, L = 250 mm |

!!!DANGER
    inside sheath 13963 please **DO NOT USE** Teflon sheath!!!

!!!NOTE
    IITCODE  13963 is alternative to the 4545 (old one - not in use ANYMORE) and it was introduced only for cost efficiency.

Please follow this [link](lower_arm_V2.md) for an extended HOWTO route the cable and go to the *Proximal Joints* section.

#### 2.1.a	THUMB peculiarity

The **THUMB** is a finger a bit particular in the wiring compared to the index and the middle because - as it is the finger with the most degrees of freedom- it needs to pass a series of pulleys at the base of it in order to add also the thumb oppose joint movement inside the articulation.

<img src="/../img/HAND_WRIST_V2/TH_SHEATHS.png" width=75%>

The IITCODE 2375 as specification described below :

| IITCODE | Alias  | Description |
| ------- | -----  | ----------- |
| 2375    | SHEATH | Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm, L = 500 mm |

Is needed for the 3 pieces circled in red on the picture above. Here are the specs for each one of them:

| Number | Type           | Length (mm) |
| ------ | -------------- | ----------- |
| 1      | distal short   | 11.5        |
| 2      | prox short (-) | 11          |
| 3      | prox short (+) | 9           |

Please follow this [link](lower_arm_V2.md) for an extended HOWTO route the cable and go to the *Proximal Joints* section.

Once the 3 proximal joints are cabled, the lateral view of the forearm should look like the picture below. The 6 sheaths are pointed by the red arrows.

<img src="/../img/lowerArm/L-4RM-sheats-prox.png">




### 2.2	Distal joints

The 5  proximal joints (theoretically 5 but in practice just 4 motors need to be wired): 

- Thumb
- Index
- Middle
- Ring and Pinkie

Located here:

| RIGHT FOREARM                                            | LEFT FOREARM                                             |
| -------------------------------------------------------- | -------------------------------------------------------- |
| <img src ="/../img/lowerArm/distals-R-V2.png" width=400> | <img src ="/../img/lowerArm/distals-L-V2.png" width=400> |

Are all wired with the cable 0.61mm coated from CARLSTAHL GmbH as per the following table:

| IITCODE | Alias    | Description  |
| ------- | -------- | ------------ |
| 2391    | U7194561 | Stainless steel microcable, cable construction 7x19mm, nom. dia 0.45mm, outer dia 0.61mm, Polyamide coated, AISI 316 - CARL STAHL GMBH |

Every sheath is made of both the following pieces:

| IITCODE | Alias       | Description |
| ------- | ----------- | ----------- |
| 2375    | SHEATH      | Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm, L = 500 mm |
|2386	  |TEFLON_SHEATH| Insulating sheath, AWG22, inner dia 0,709 -0/+0,102 mm, material thickness 0,152 -0/+0,102mm, teflon, transparent |

Please follow this [link](lower_arm_V2.md) for an extended HOWTO route the cable and go to the *Distal Joints* section.

### 2.3	Thumb Oppose

> To build the thumb oppose you just need 2 pieces of the sheath IITCODE 13963

| Label | Dimension (mm) | IITCODE - SHEATH |
| ----- | -------------- | ---------------- |
| S0    | 50             | 13963            |
| S2    | 57             | 13963            |

!!!DANGER
    inside sheath 13963 please **DO NOT USE** Teflon sheath!!!

> And approximatively **50cm** of IITCODE  1815 to route it.

| IITCODE | Alias     | Description   |
| ------- | ----------| ------------- |
| 1815    | CG077063  | Stainless steel microcable, cable construction 7x7mm, nom. dia 0,63mm, not coated, AISI 316 |
| 13963   | MAZZONI_0_3-0_8-250_SS_SHEATH | Rectangular section sheath 0.3x0.8, L = 250 mm    |

> Here is a more detail specification of where to find the 2 pieces:

| Left Hand                                                    | Right Hand                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="/../img/HAND_WRIST_V2/Opposite_palm-view.png" width="700"> | <img src="/../img/HAND_WRIST_V2/R_Th-opp-d-view.png" width="700"> |

Please follow this [link](wrist_hand_cabling_V2.md) for an extended HOWTO route the cable and go to the *HAND Wiring - Thumb oppose* section.

### 2.4	Fingers Abduction

> To build the fingers abduction you just need 3 pieces of the sheath IITCODE 2375

| Label | Dimension(mm) | IITCODE - SHEATH |
| ----- | ------------- | ---------------- |
| T0    | 90            | 2375             |
| T2    | 27            | 2375             |
| T4    | 44            | 2375             |

!!!DANGER
    inside sheath 2375 please **DO NOT USE** Teflon sheath!!!

> and approximatively 50cm of IITCODE 1815 to route it.

| IITCODE | Alias    | Description |
| ------- | -------- | ----------- |
| 1815    | CG077063 | Stainless steel microcable, cable construction 7x7mm, nom. dia 0,63mm, not coated, AISI 316 |
| 2375    | SHEATH   | Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm, L = 500 mm |

> Here is a more detail specification of where to find the 3 pieces:

| Left Hand                                                    | Right Hand                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="/../img/HAND_WRIST_V2/L_hand_f_abd_new.png" width=700> | <img src="/../img/HAND_WRIST_V2/R_hand_f_abd_new.png" width=700> |

Please follow this [link](wrist_hand_cabling_V2.md) for an extended HOWTO route the cable and go to *HAND Wiring - Fingers abduction* section.

## 3. HOW TO CABLE - WRIST

### 3.1 	Wrist tendons length

Here is the list of the 10 tendons needed to build the wrist movements:

<center>

<img src='/../img/HAND_WRIST_V2/ICUB_Tendon_Left_Right.png'>

</center>

<center>


| Tendon | IITCODE | Length | Alias            |
| ------ | ------- | ------ | ---------------- |
| 1      | 6400    | 72 mm  | RC_IIT_019_G_019 |
| 2      | 6402    | 84 mm  | RC_IIT_019_G_020 |
| 3      | 6404    | 101 mm | RC_IIT_019_G_021 |
| 4      | 6413    | 124 mm | RC_IIT_019_G_022 |
| 5      | 6414    | 107 mm | RC_IIT_019_G_023 |
| 6      | 6415    | 113 mm | RC_IIT_019_G_024 |
| 7      | 6416    | 112 mm | RC_IIT_019_G_025 |
| 8      | 6417    | 107mm  | RC_IIT_019_G_026 |
| 9      | 6418    | 51 mm  | RC_IIT_019_G_027 |
| 10     | 6419    | 43 mm  | RC_IIT_019_G_028 |
</center>

</center>

### 3.2 Construction table

The overall cables of the wrist are all build from IITCODE 4482 (of Length defined in the table above) and 2 crimps IITCODE 4722, here is the table reporting the specifics of those pieces:

| IITCODE | Number of pieces | Alias/Provider Code | Description                                                  |
| ------- | ---------------- | ------------------- | ------------------------------------------------------------ |
| 4482    | 1                | CG077081            | Stainless steel microcable, cable construction 7x7mm, nom. dia 0,81mm, not coated, AISI 304 |
| 4722    | 2                | RC_TLR_010_P_100    | THIMBLE FOR CABLE 0.8mm                                      |

</center>

### 3.3 Right Forearm - Wrist motor tendons

From the pictures below you will be able to locate and identify the 8 tendons inside the **Right Forearm** building the active part of the wrist tendons.

<img src='/../img/HAND_WRIST_V2/R_4RM_A.png' width =auto>

<img src='/../img/HAND_WRIST_V2/R_4RM_B.png' width =700>

</center>

### 3.4 Left Forearm - Wrist motor tendons

From the pictures below you will be able to locate and identify the 8 tendons inside the **Left Forearm** building the active part of the wrist tendons.

<img src='/../img/HAND_WRIST_V2/L_4RM_A.png' width =600>

<img src='/../img/HAND_WRIST_V2/L_4RM_B.png' width =650>

</center>

### 3.5 Tensioner - IITCODE 3514

<img src = "/../img/HAND_WRIST_V2/Tensioner_description.png">

To properly tense the 8 tendons of the Forearm it is mandatory to add the tensioner IITCODE 3514 - alias CAD of the assembly: RC_TLR_010_G014 - it is made by the following pieces:

<center>

| IITCODE | Revision | Alias            | Description     |
| ------- | -------- | ---------------- | --------------- |
| 3559    | A3       | RC_TLR_010_P_050 | TENSIONER BODY  |
| 3560    | A1       | RC_TLR_010_P_046 | TENSIONER SCREW |
| 3561    |          | RC_TLR_010_P_049 | LOCK NUT        |
| 3562    | A1       | RC_TLR_010_P_048 | TENSIONER SCREW |
| 3563    |          | RC_TLR_010_P_047 | LOCK NUT        |

</center>

</center>

### 3.6 Wrist - Passive tendons

From the pictures below you will be able to locate and identify the 2 tendons inside both the **Right Wrist** and **Left Wrist** building the passive part of the wrist movements.

| RIGHT WRIST                                          | LEFT WRIST                                           |
| ---------------------------------------------------- | ---------------------------------------------------- |
| <img src='/../img/HAND_WRIST_V2/R_wrist_label.png' > | <img src='/../img/HAND_WRIST_V2/L_wrist_label.png' > |