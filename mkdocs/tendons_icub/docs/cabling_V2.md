# LOWER ARM V2 CABLING

## CAD DESIGN

> let's have an overview of the mechanical CAD from different view angles.

| Left Forearm V2                                         | Right Forearm V2                                        |
| ------------------------------------------------------- | ------------------------------------------------------- |
| <img src ="/GIF/lower_arm/L-4RM-V2.gif" height = 600px> | <img src ="/GIF/lower_arm/R-4RM-V2.gif" height = 600px> |



## 1.	WHAT DO I NEED TO CABLE

Here are following the overall tables describing the necessary parts when routing the cables onto the 11 motors (12 motors inside the Lower Arm but just 11 use cables) and during the path they make.

### 1.1	Proximal joints

The 3 proximal joints : 

- Thumb
- Index
- Middle

located here:

| LEFT FOREARM                                                 | RIGHT FOREARM                                                |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src ="/img/lowerArm/L_4RM_Prox_Pos.png" height=auto width=700> | <img src ="/img/lowerArm/R_4RM_Prox_Pos.png" height=auto width=700> |
| <img src ="/img/lowerArm/L4RM-ElbowView.png" height=auto width=400> | <img src ="/img/lowerArm/R4RM-ElbowView.png" height=auto width=400> |

are all wired with the cable 0.63mm uncoated from CARLSTAHL Gbhm as per the follwing table

| IITCODE | Alias    | Description  |
| ------- | -------- | ------------ |
| 1815    | CG077063 | Stainless steel microcable, cable construction 7x7mm, nom. dia 0,63mm, not coated, AISI 316 |

every sheath in which the cable pass through (+ and - ) are made of:

| IITCODE | Alias                         | Description |
| ------- | ----------------------------- | ----------- |
| 13963   | MAZZONI_0_3-0_8-250_SS_SHEATH | Rectangular section sheath 0.3x0.8, L = 250 mm |

!!!DANGER
    inside sheath 13963 please **DO NOT USE** teflon sheath!!!

!!!NOTE
    IITCODE  13963 is alternative to the 4545 (old one - not in use ANYMORE) and it was introduced only for cost efficiency

Please follow this [link](Lower_Arm_V2.md) for an extended HOWTO route the cable.

#### 1.1.a	THUMB peculiarity

THe THUMB is a bit particular because - as it is the finger with the most degree of freedom- need to pass a serie of pulley at the base of the Thumb in order to add also the thumb oppose joint inside the articulation.

<img src="/img/HAND_WRIST_V2/TH_SHEATHS.png" width=75%>

The IITCODE 2375 as specification retranscripted below :

| IITCODE | Alias  | Description |
| ------- | -----  | ----------- |
| 2375    | SHEATH | Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm, L = 500 mm |

are needed for the 3 pieces circled in red on the picture above here the specs for each one of them:

| Number | Type           | Length (mm) |
| ------ | -------------- | ----------- |
| 1      | distal short   | 11.5        |
| 2      | prox short (-) | 11          |
| 3      | prox short (+) | 9           |

Please follow this [link](Lower_Arm_V2.md) for an extended HOWTO route the cable.

Once the 3 proximal joints are cabled, the lateral view of the forearm should look like this
<center>
    <img src="/img/HAND_WRIST_V2/L4RM-cabling.png">
</center>

### 1.2	Distal joints

The 5  proximal joints (theoritically 5 but in practice just 4 motors need to be wired): 

- Thumb
- Index
- Middle
- Ring and Pinkie

located here:

| RIGHT FOREARM                                         | LEFT FOREARM                                          |
| ----------------------------------------------------- | ----------------------------------------------------- |
| <img src ="/img/lowerArm/distals-R-V2.png" width=400> | <img src ="/img/lowerArm/distals-L-V2.png" width=400> |

are all wired with the cable 0.61mm coated from CARLSTAHL Gbhm as per the following table

| IITCODE | Alias    | Description  |
| ------- | -------- | ------------ |
| 2391    | U7194561 | Stainless steel microcable, cable construction 7x19mm, nom. dia 0.45mm, outer dia 0.61mm, Polyamide coated, AISI 316 - CARL STAHL GMBH |

every sheath are made of both the following pieces:

| IITCODE | Alias       | Description |
| ------- | ----------- | ----------- |
| 2375    | SHEATH      | Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm, L = 500 mm |
|2386	  |TEFLON_SHEATH|	Insulating sheat, AWG22, inner dia 0,709 -0/+0,102 mm, material thickness 0,152 -0/+0,102mm, teflon, transparent|

Please follow this [link](Lower_Arm_V2.md) for an extended HOWTO route the cable.



### 1.3	Thumb Oppose

> To build the thumb oppose you just need 2 pieces of the sheath IITCODE 13963
>
> | Label | Dimension (mm) | IITCODE - SHEATH |
> | ----- | -------------- | ---------------- |
> | S0    | 50             | 13963            |
> | S2    | 57             | 13963            |
>
> approximatively **50cm** of IITCODE  1815 to route it.

| IITCODE | Alias     | Description   |
| ------- | ----------| ------------- |
| 1815    | CG077063  | Stainless steel microcable, cable construction 7x7mm, nom. dia 0,63mm, not coated, AISI 316 |
| 13963   | MAZZONI_0_3-0_8-250_SS_SHEATH | Rectangular section sheath 0.3x0.8, L = 250 mm               |

| Left Hand     | Right Hand  |
| ------------- | ----------- |
| <img src="/img/HAND_WRIST_V2/Opposite_palm-view.png" width="700"> | <img src="/img/HAND_WRIST_V2/R_Th-opp-d-view.png" width="700"> |

Please follow this [link](wrist_hand_cabling_V2.md) for an extended HOWTO route the cable.

### 1.4	Fingers Abduction

> To build the thumb oppose you just need 3 pieces of the sheath IITCODE2375 
>
> | Label | Dimension(mm) | IITCODE - SHEATH |
> | ----- | ------------- | ---------------- |
> | T0    | 90            | 2375             |
> | T2    | 27            | 2375             |
> | T4    | 44            | 2375             |
>
> and approximatively 50cm of IITCODE  1815 to route it.

| IITCODE | Alias    | Description                                                  |
| ------- | -------- | ------------------------------------------------------------ |
| 1815    | CG077063 | Stainless steel microcable, cable construction 7x7mm, nom. dia 0,63mm, not coated, AISI 316 |
| 2375    | SHEATH   | Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm, L = 500 mm |

| Left Hand                                                   | Right Hand                                                  |
| ----------------------------------------------------------- | ----------------------------------------------------------- |
| <img src="/img/HAND_WRIST_V2/L_hand_f_abd.png" width="700"> | <img src="/img/HAND_WRIST_V2/R_hand_f_abd.png" width="700"> |



Please follow this [link](wrist_hand_cabling_V2.md) for an extended HOWTO route the cable.

# 2.	Finger sheaths

## 2.1  SHEATH Versions

| IITCODE | Alias        | Description   |
| ------- | ------------ | ------------- |
| 2375    | SHEATH       | Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm, L = 500 mm |
| 13963   | MAZZONI_0_3-0_8-250_SS_SHEATH | Rectangular section sheath 0.3x0.8, L = 250 mm               |
|2386	  |TEFLON_SHEATH|	Insulating sheat, AWG22, inner dia 0,709 -0/+0,102 mm, material thickness 0,152 -0/+0,102mm, teflon, transparent|

!!!DANGER
    inside sheath 13963 please **DO NOT (NEVER) USE** teflon sheath!!!


## 2.2 SHEATH LENGTH & LABELLING

Please refer to this table to find out which sheath you need to install at the right place and the right label to add on top of it


| Finger  | Typology     | Label   | Length (mm) | IITCODE - sheath |
| ------- | ------------ | ------- | ----------- | ---------------- |
| Thumb   | Proximal     | 6+      | 185         | 13963            |
| Thumb   | Proximal     | 6-      | 185         | 13963            |
| Thumb   | Short Prox + | pict. above | 9       | 2375             |
| Thumb   | Short Prox - | pict. above | 11      | 2375             |
| Thumb   | Distal       | N4      | 57          | 2375  (+teflon)  |
| Thumb   | Short Dist   | pict. above | 11.5    | 2375             |
| Thumb   | oppose       | S0      | 50          | 13963            |
| Thumb   | oppose       | S2      | 57          | 13963            |
| Index   | Proximal     | 8+      | 224         | 13963            |
| Index   | Proximal     | 8-      | 224         | 13963            |
| Index   | Distal       | N5      | 105         | 2375  (+teflon)  |
| Middle  | Proximal     | 7+      | 224         | 13963            |
| Middle  | Proximal     | 7-      | 224         | 13963            |
| Middle  | Distal       | N3      | 105         | 2375  (+teflon)  |
| Ring    | Distal       | N2      | 95          | 2375  (+teflon)  |
| Pinkie  | Distal       | N9      | 95          | 2375  (+teflon)  |
| Fingers | abduct       | T0      | 90 (1)      | 2375             |
| Fingers | abduct       | T2      | 27          | 2375             |
| Fingers | abduct       | T4      | 44          | 2375             |

(+teflon) refers to the IITCODE 2386

!!! NOTE
    (1) the length 90 mm of T0 comes from previous version where there was: T0+T3+tensioner (38+38+14 mm)

!!! WARNING
    For the proximal sheath, please label either the start of the sheath(base of the motor at the level of the elbow) and at the end of it		   	

