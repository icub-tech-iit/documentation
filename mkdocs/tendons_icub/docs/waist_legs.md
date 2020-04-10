
# **Waist, Stand Locker and Legs Cabling Manual**

## 1	Cable construction

<center>![waist](img\waist\cables_all.png)</center>
<center> 11  : length 709 mm - Diam. 1.5/1.75</center>
<center> 12  : length 488 mm - Diam. 1.5/1.75</center>
<center> 13  : length 630 mm - Diam. 1.5/1.75 </center>
<center> 14  : length 729 mm -  Diam. 1.5/1.75 </center> 
<center> 15  : length 450 mm -  Diam. 1.5/1.75 </center> 
<center> 16  : length 530 mm -  Diam. 1.5/1.75 </center> 
<center> 29  : length &nbsp;&nbsp;23 mm - Diam. 1.5/1.75 </center>
> Each cable from the list above is made of U7191517 (IITCODE 2390) with its belonging lengths and 2 crimps RC_TLR_003_P_101 (IITCODE 3492).


| IITCODE | Alias | Description  |
| ---- | -------  | ---- |
| 2390    | U7191517  | Stainless, cable construction 7x19mm, Polyamide coated - CARL STAHL GMBH |
| 3492    | RC_TLR_003_P_101| Thimble for cable 1.75mm (Diam int/ext/L 1.6/4.6/6 mm) - material X5CrNiMo1712-AISI316 |

> Alternatively, each cable can be seen as an assembly with its respective IITCODE and alias taken from CAD named RC_IIT_019_G_0XX - where XX is number from 11 to 16.

| IITCODE | Alias |Revision | Description  |
| ---- | ------- | ------- | ---- |
| 4768    | RC_IIT_019_G_011   |   1   | WAIST BACK CABLE 11 |
| 4769    | RC_IIT_019_G_012   |   1   | WAIST FRONT CABLE 12 |
| 4770    | RC_IIT_019_G_013   |   1   | WAIST TOP CABLE 13 |
| 4771    | RC_IIT_019_G_014   |   1   | HIP FLEXION CABLE 14 |
| 4772    | RC_IIT_019_G_015   |   1   | ANKLE FLEXION CABLE 15 |
| 6377    | RC_IIT_019_G_016   |   1   | ANKLE FLEXION V2 CABLE 16 |



> Cable 29 instead is aliased RC_IIT_090_G_005. At the moment this cable is home-made.


## 2	WAIST

> This chapter describes the steps required for the wiring of the cables 11 - 12 - 13 which allow the movement of the waist of the robot, both during construction and in maintenance/repair phase.[<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position013)

!!!note "VERY IMPORTANT NOTE"
    If you have only the cable 12 broken please proceed directly to [2.3](#23-waist-front-cable-12)

> Whatever the other cases of figure you run into, the only way to substitute/replace the broken cables is to follow the next steps.

### 2.1	CHEST, BACK and BACK PACK COVERS DISMOUNTING



**A - CHEST cover removal**

| pictures                                               | step by step guide                                           |
| ------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="../img/waist/chest-screws1.png" width = 300> | <u>STEP 1:</u><br/>remove the 6 screws M2x5 (red arrows)<br/> (3 on each side of the skin patch of the chest cover)<br/>If you do not have skin on torso cover go on to the next step.<br/><br/><u>STEP 2:</u><br/>flip over the skin in order to access<br/> the 2 screws beneath it.<br/>Remove the 2 screws M3x6<br/><br/><u>STEP 3:</u><br/>hold the chest cover and remove the 2 crews M3x8 at the level of the shoulder (green circles)<br/><br/> |
| pictures of the connector                              | <u>STEP 4:</u><br/>disconnect the the electrical cable connecting the robot to the skin board inside the cover<br/>If you do not have skin on torso cover go on to the next step. |



> depending of your version you will need to move sideways the back cover or the backpack.
> version without backpack

**B1 - NO BACKPACK VERSION**

| pictures                                              | step by step guide                                           |
| ----------------------------------------------------- | ------------------------------------------------------------ |
| <img src="../img/waist/torso-screws.png" width = 300> | <u>STEP 1:</u><br/>Unscrew the power cord on the back of iCub (black circle)<br/><u>STEP 2:</u><br/>Remove the 2 ring screws (green circles)<br/><u>STEP 3:</u><br/>remove the 4 screws M3x6 to be able to move sideways the back cover |

**B2 - BACKPACK VERSION**

| pictures                                                     | step by step guide                                           |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| picture of robot with connections                            | <u>STEP 1:</u><br/> disconnect the overall cables attached to the back pack -> |
| <img src="../img/waist/top-bp-cover.png" width = 300>        | <u>STEP 2:</u><br/>remove the top cover of the back pack<br/>some version have a screw in the yellow circle some just a magnet<br/>If you have the version with the screw - remove it and just flip the cover and you are done. |
| <img src="../img/waist/btp-screws-real.png" width = 300><br/><img src="../img/waist/btp-screws-dummy.png" width = 300> | <u>STEP 3:</u><br/>Either you use the <u>real</u> battery pack<br/>-> untighten the 2 lateral screws<br/>or the <u>dummy</u> battery pack<br/>-> remove the 2 lateral screw M2.5x10. |
| <img src="../img/waist/nut-screws.png" width = 300>          | <u>STEP 4:</u><br/>slide the 2 two pieces and remove them    |
| <img src="../img/waist/bp-buttons.png" width = 250>          | <u>STEP 5:</u><br/>remove the buttons' cache by unmounting the screw M2x6 |
| <img src="../img/waist/bp-power-board.png" width = 300>      | <u>STEP 6:</u><br/>loose the 2 screws M2.5x8 holding the switches/ethernet board and push it inwards<br />**!!!NEED PICTURE TO SHOW THAT!!!** |
| <img src="../img/waist/stand-offs.png" width = 300>          | <u>STEP 7:</u><br/>On the previous mention board, try to pop out the stand-off <br/>above the 2 push buttons.<br/>they will be in the way when we will try to remove<br/> the backpack cover later on, we may break them<br/> if remove wrongly |
| <img src="../img/waist/bp-screws.png" width = 300>           | <u>STEP 8:</u><br/>remove the 4 screws (red circles) holding the back pack in place.<br/>NECK : 2 screws M3x8<br/>bottom back pack cover : 2 screws M3x12<br/>Theoretically, you should already have removed the 2 ring screws<br/>but if you forget, please do it now!! |
|                                                              | <u>STEP 9:</u><br/>remove the backpack -> gif                |
|                                                              | watch out!!!                                                 |
| **PHOTO**(S)                                                 | <u>STEP 10:</u><br/>disconnect the 3 connectors (2 on switch board - for the power of the 2 fans- and 1 on power board) |
| **PHOTO**                                                    | <u>STEP 11:</u><br/>cut the tie wrap -> the back cover can be left away until we will need to remount it |
| <img src="../img/waist/btp_holder-screws.png" width = 300>   | <u>STEP 12:</u><br/>remove the 4 screws holding the battery pack holder.<br/>2 screws M3x8 (yellow circle)<br/>2 screws M3x6 (red circle)<br/>!!! the battery pack holder can move almost freely from now on !!! |

YOU would probably asking me why did we need to remove all of this for?
And the answer is that unfortunately the cover are preventing us for either tense the cables or access to some pieces.

IF YOU HAVE **<u>ONLY</u>**CABLE 13 BROKEN JUST GO DIRECTLY [HERE](#24-waist-top-cable-13)

**C - remove the back pulley**

!!!WATCH OUT
    once the pulley or one side of the cable 13 is remove the rotation of the torso is totally free, someone else help is more than appreciated to hold it firm.

| what we have                                 | what we want                                 |
| -------------------------------------------- | -------------------------------------------- |
| <img src="../img/waist/WWH.png" width = 500> | <img src="../img/waist/WWW.png" width = 500> |



| pictures                                                     | step by step guide                                           |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="../img/waist/cable13-tens-screws.png" width = 500> | <u>STEP 1:</u><br/>loose the screws inside of the tensioners<br/>to get some slack on the cable.<br/>You should be able to make he cable jump around the |
| <img src="../img/waist/pulley13.png" width = 500>            | <u>STEP 2:</u><br/>You should be able to make the cable jump over the pulley |
| <img src="../img/waist/screw13.png" width = 500>             | <u>STEP 3:</u><br/>Remove the central screw of this pulley RC_TLR_001_P_243 |
|                                                              | <u>STEP 4:</u><br/>Use 2 fat flat screwdrivers to make the pulley popping up.<br/>**-> photo needed** |

**D- create the require space**

| pictures                                                 | step by step guide                                           |
| -------------------------------------------------------- | ------------------------------------------------------------ |
| <img src="../img/waist/space11.png" width = 500>         | In order to change the cable 11, <br/> it is necessary, when you still have the upper body attached to the robot <br/> to create some space in between those 2 pieces to be able to fit the cable that you need to replace. |
| <img src="../img/waist/plate11.png" width = 500>         | <u>STEP 1:</u><br/>Remove the central piece which will hold the cable 11.<br/> 4 screws M2.5v5 |
| <img src="../img/waist/unmount11-back.png" width = 500>  | <u>STEP 2:</u><br/>Untighten just enough to have 2mm gap in between the head screw and the plate |
| <img src="../img/waist/unmount11-front.png" width = 500> | <u>STEP 3:</u><br/>Untighten just enough to have 2mm gap in between the head screw and the plate |
| <img src="../img/waist/R-side11.png" width = 500><br/>   | <u>STEP 4:</u><br/>You should be able to move slightly the upper body<br/>from the torso and create some space (2mm max). |



### 2.2	WAIST BACK - Cable 11

<center>![waist](img\waist\Waist_cable_11.png)</center>
!!! WARNING
    routing cable 11 is quite simple in process of construction because you don't have yet the upper body mounted atop of the waist **<u>BUT</u>** become particularly tedious in phase of repair due to the presence of this latter. If you haven't removed the cover above the torso and the back (or backpack cover), please follow this [link](#21-chest-back-and-back-pack-covers-dismounting)



**Procedure:**

> Take the cable and draw with a marker the middle of it. Place the cable onto the slot of the pulley (Photo 1). Put the squared plate above the cable and secure it with 4 screws with hexagonal head size M2.5x5 (Photo 2)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position015)



![waist](img\waist\Waist_cable_11_foto.png)



!!!WARNING
    For people having the upper body still hanging **CLOSE** the gap <center><img src="../img/waist/close-gap.png" width = 500></center>



> Turn the cable around the pulley taking care to cross it at the opposite side of the plate (Photo 3 - 4).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position016)

<center>![waist](img\waist\Waist_cable_11_foto3_4.png)</center>


> Each side of the cable go up and pass into the little side pulley (Photo 5 - 6)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position017)

!!! Tip
    Use a 2mm hexagonal screwdriver to spin the motor shaft (Photo N.9)  - on both sides of iCub hips - allowing you to rotate the internal pulley (where yield the tensioners) and have it in a proper angle.

<center>![waist](img\waist\Waist_cable_11_foto5_6.png)</center>
> To finish the wiring, position the head of the crimps inside their respective tensioners on both side of the inner part of the hips (Photo 7 - 8).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position018)


<center>![waist](img\waist\Waist_cable_11_foto7_8.png)</center>
> To bring the joint a proper position to start correctly the routing of cable 12, please use the head screw inside the hips (Photo 9) simultaneously or one hip at a time by few degree every now and then. To arrive on the position (Photo 10)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position019)

<center>![waist](img\waist\Waist_cable_11_foto9-10.png)</center>
### 2.3	WAIST FRONT – Cable 12

<center>![waist](img\waist\Waist_front.PNG)</center>

 **Procedure:**

> Take the cable and draw with a marker the middle of it. Place the cable into the slot of the pulley (Photo 12)
[<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position020)

<center>![waist](img\waist\Waist_cable_11_foto11-12.png)</center>
> Put the rectangular plate above the cable and secure it with 4 screws M2.5x5 hexagonal head (Photo 13). Turn the cable around the pulley taking care to cross the cable above the pulley (Photo 14).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position020)

<center>![waist](img\waist\Waist_cable_11_foto13-14.png)</center>
> To finish the wiring, position the head of the crimps inside their respective tensioners on both side of the inner part of the hips (Photo 15 - 16)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position021)

<center>![waist](img\waist\Waist_cable_11_foto15-16.png)</center>
> Finally, To put an end to the wiring of cable 11 and 12, just tense the 4 tensioners on which the crimps are located. Take care of tensing every one of them little by little in order to share the tension inside the tensioners in the same way.
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position022)

<center>![waist](img\waist\Waist_cable_foto 17.png)</center>
> At this point, the cables of the wiring of the waist 11 and 12 is terminated and therefore it is possible to proceed with the positioning of the upper body above the latter.
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position023)

### 2.4	WAIST TOP – Cable 13

<center>![waist](img\waist\Waist_top.PNG)</center>
**Procedure:**

> Take the cable and draw with a marker the middle of it. Place it in the slot on the piece RC_TLR_001_P_243 (Photo 18).Put the plate RC_USAL_001_P_219 on the cable and secure it with 4 screws M2.5x5 hexagonal head (Photo 19).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position024)

<center>![waist](img\waist\Waist_top18_19.PNG)</center>
> Turn the cable around the RC_TLR_001_P_243 piece taking care to cross it around the pulley, the opposite side to the plate (Photo 20).Then pass the cable through the grooves of the pulleys RC_USAL_001_P_119 (Photo 21) 
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position025)

<center>![waist](img\waist\Waist_top20_21.PNG)</center>
> To Finish the wiring, draw the cable along the pulley RC_USAL_001_P_124, and place the crimp in the appropriate tensioner RC_USAL_001_P_131 (Photo 22).Do the same for the other side of the cable and cross the cable before reaching the tensioner (Photo 23).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position026)

<center>![waist](img\waist\Waist_top22_23.PNG)</center>
## 3	LEG CABLING

> This chapter describes the steps required both during construction and in maintenance phase to route of the cables 14 of the hip of the robot and cables 15 or 16 of the ankle present on robot with lower body version 1.[<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position013)


### 3.1	HIP FLEXION – Cable 14

<center>![waist](img\waist\Wiring-LEG_Cable_14.PNG)</center>
**Preparation:**

> The cable has to be previously peeled off, at a distance of 435 mm from crimp, for a total of 50 mm. (see below)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position027)

<center>![waist](img\waist\Wiring-LEG_Cable_14_built.PNG)</center>
!!! TIP
    the latter version of iCub have a cover, you may need to remove it before proceeding(see picture below). To do that remove the 2 screws of the cover. To unscrew them it is important to see them, use a hexagonal screw driver 2mm and turn the motor shaft from the other side of the motor(see picture below).

    <center>![waist](../img/waist/hip-cover.png)</center>

**Procedure:**

> Take the cable and place the part stripped in the slot on the piece RC_IIT_001_P_314, then center and block it with the help of the plate RC_IIT_001_P_328 (Photo 24). The shortest part of the cable is the one going outside of the robot.
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position028)

<center>![waist](img\waist\Wiring-LEG_24_25.PNG)</center>
> Take the inner part of the cable (the right one so to speak – or the longest) and make one turn around the pulley RC_IIT_001_P_314 (Photo 25). If done correctly you should have the 2 crimps reunited down below the hip (photo N.26).
> At this point proceed route the cables by making an 8 shape, by crossing the cables and follow the wiring (photo N.28) (shortest part - yellow cable) and insert both crimp inside their respective tensioner -  piece RC_USAL_001_P_131 (Photo 27).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position028)

<center>![waist](img\waist\Wiring-LEG_26_27_28.PNG)</center>
### 4.1	ANKLE FLEXION - Cable 15 or Cable 16

Those 2 cables are only on some previous iCub design V1.

> Follow the following diagram in order to rewire correctly.

|ANKLE FLEXION - cable 15 | ANKLE FLEXION - cable 16|
| ---| --- |
|<center>![waist](../img/waist/15-wiring.png)</center>|<center>![waist](../img/waist/16-wiring.png)</center>|

!!! TIP
    remove the blocker-cover to adjust the cable - when finally wired and the foot 90 degree respect to leg, put it back and tighten firmly the screws holding it in place.
    

|ANKLE FLEXION - cable 15 | ANKLE FLEXION - cable 16|
| ---| --- |
|<center>![waist](../img/waist/cover-15.png)</center>|<center>![waist](../img/waist/cover-16.png)</center>|


## 5	STAND – FAST ROBOT LOCKER 

> This chapter describes the construction of fast locker to connect the robot to the stand seat
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position029)

### 5.1	STAND  - Cable 29 

**Procedure:**

> Take the cable and put it so that the crimp goes into the slot of the piece RC_IIT_090_P_009 (Photo 29-30).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position031)

<center>![waist](img\waist\Stand_Cable_29_foto29_30.PNG)</center>
> Attach the hook, or the piece PKWS4SLIDER with two screws 3x5 TSV, to RC_IIT_090_P_009 piece (Photo 31).Place on the part of the cable RC_IIT_090_P_007 piece and then the adjustment mechanism for proper closure piece RC_IIT_090_P_007 (Photo 31-32)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position032)

<center>![waist](img\waist\Stand_Cable_29_foto31_32.PNG)</center>
> At this point, proceed by entering what has been previously mounted into the slot of the support RC_IIT_090_P_005 (Photo 33).Complete the installation by screwing the threaded part of the piece RC_IIT_090_P_006 with the piece  RC_IIT_090_P_008 (Photo 34)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position033)

<center>![waist](img\waist\Stand_Cable_29_foto33_34.PNG)</center>