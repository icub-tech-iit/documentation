
# **Waist, Stand Locker and Legs Cabling Manual**

## <u>Cable construction:</u>

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


# WAIST

> This chapter describes the steps required for the wiring of the cables 11 - 12 - 13 which allow the movement of the waist of the robot, both during construction and in maintenance/repair phase.[<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position013)

## WAIST BACK - Cable 11

<center>![waist](img\waist\Waist_cable_11.png)</center>
!!! WARNING
    routing cable 11 is quite simple in process of construction because you dont have yet the upper body mounted atop of the waist BUT become particularly tedious in phase of repair due to the presence of this latter.

#### CONSTRUCTION PROCESS OR REPAIR?

!!! note "Shortcut"
    if you just start routing on the lower part **without** the upper body mounting please jump to **PHASE TWO.**



### **PHASE ONE**

#### HOW TO BE IN SITUATION TO START ROUTING

>  The goal of this first phase is to remove the broken cable or simply to create some space  in between 2 pieces in order to pass the cable 11and access the slot where the cable will be fixed so as to proceed on **PHASE TWO**.





-> picture of the space that need to be created





to do so we need to unwire the cable 13 but **before we need to untighten the screws of cable 13 tensioners. BUT one more time to do so we need to be able to access those screws. and ** here yields the overall problem.
we will divide the first phase into 4 steps:
	A:remove the **chest** cover.
	B:release the **back**  or **backpack** cover (depending on the version of iCub you own).
	C:remove the pulley in the back of iCub (meaning unwiring the cable 13 to access the screws of the slot where yields the starting point for cable 11 routing)
	D:create the necessary space in between the 2 pieces (see pictures above) to fit the cable 11.
	E: retighten the 4 screws holding the upper body

!!!hint
    the help of another person is quite recommended!!!



#### A - CHEST cover removal

1- remove the 6 screws (3 on each side of the skin patch above the chest cover)
2- flip the skin in order to access tje 2 screws beneath it and remove them
3- hold the chest cover and remove the 2 crews at the level of the shoulder
4- disconnect the the electrical cable connecting the robot to the skin board inside the cover

depending of your version you will need to move sideways the back cover or the backpack.
version without backpack

#### B1 - NO BACKPACK VERSION

1- disconnect the power cord from the back of iCub 
2- remove the 4 screws to be able to move sideways the back cover
-> picture of the 4 screws to remove to be able to move sideways the back cver

#### B2 - BACKPACK VERSION

1- disconnect the overall cables attached to the back pack -> 
2- remove the top cover of the back pack
3- remove the battery pack (real or dummy either way). -> photo
4- remove the buttons' cache - remove the screw -> photo
5- loose the 2 screws holding the switches/ethernet board and push it inwards
6- remove the stand off buttons
7- remove the 6 screws holding the back pack in place -> photo CAD
8 - remove the backpack -> gif 
watch out!!!
9- disconnect the 3 connectors (2 on switch board - for the power of the 2 fans- and 1 on power board)
10- cut the tie wrap -> the back cover can be left away until we will need to remomunt it
11- remove the 4 screws holding the battery pak holder -> the holder can move almost freely

You are now able to untighten the 2 screws tensionning the cale 13

#### C - remove the back pulley

1- loose the screws of the tensionners to get some slack on the cable.
2- remove the central screw of the pulley
3- use 2 fat screwdrivers to make the pulley popping up.
-> photo needed

!!!WATCH OUT
    once the pulley or one side of the cable 13 is remove the rotation of the torso is totally free, someone else help is more than welcome.

It requires first to unplug the cable 13 (please follow instructions on how to remove either the back cover or the backpack in order to access the tensionning screws which you will need to untighten). Remove the back pulley RC_TLR_001_P_243 as well as slightly untightened 4 screws to have the possibility to move backward the piece XXX_XXXXX_XXX and create enough space to pass the crimp.

D- 
!!!DANGER "pictures to add"
    ![waist](../img/waist/back-pulley.png)
​    4 screws and sliding piece to pass crimp 

E- RE-ASSEMBLE the upper body by retightening the 4 screws we had to lose to create the space to paas cable 11.

FINISHED

PHASE TWO 
**Procedure:**

> Take the cable and draw with a marker the middle of it. Place the cable onto the slot of the pulley (Photo 1). Put the squared plate above the cable and secure it with 4 screws with hexagonal head size M2.5x5 (Photo 2)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position015)

<center>![waist](img\waist\Waist_cable_11_foto.png)</center>
> Turn the cable around the pulley taking care to cross it at the opposite side of the plate (Photo 3 - 4).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position016)

<center>![waist](img\waist\Waist_cable_11_foto3_4.png)</center>
> Each side of the cable go up and pass into the little side pulley (Photo 5 - 6)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position017)

!!! Tip
    Use a 2mm hexagonal screwdriver to spin the motor shaft (Photo N.9)  - on both sides of iCub's hips - allowing you to rotate the internal pulley (holding the tensionner) and have it in a proper angle.

<center>![waist](img\waist\Waist_cable_11_foto5_6.png)</center>
> To finish the wiring, position the head of the crimps inside their respective tensioners on both side of the inner part of the hips (Photo 7 - 8).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position018)


<center>![waist](img\waist\Waist_cable_11_foto7_8.png)</center>
> To bring the joint a proper position to start correctly the routing of cable 12, please use the head screw inside the hips (Photo 9) simultaneously or one hip at a time by few degree every now and then. To arrive on the position (Photo 10)
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position019)

<center>![waist](img\waist\Waist_cable_11_foto9-10.png)</center>
## WAIST FRONT – Cable 12

<center>![waist](img\waist\Waist_Front1.PNG)</center>
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

## WAIST TOP – Cable 13

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
# LEG CABLING

> This chapter describes the steps required both during construction and in maintenance phase to route of the cables 14 of the hip of the robot and cables 15 or 16 of the ankle present on robot with lower body version 1.[<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position013)


## HIP FLEXION – Cable 14

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
> Take the inner part of the cable (the right one so to speak – or the longest) and make one turn around the pulley RC_IIT_001_P_314 (Photo 25). If done correcly you should have the 2 crimps reunited down below the hip (photo N.26).
> At this point proceed route the cables by making an 8 shape, by crossing the cables and follow the wiring (photo N.28) (shortest part - yellow cable) and insert both crimp inside their respective tensionner -  piece RC_USAL_001_P_131 (Photo 27).
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position028)

<center>![waist](img\waist\Wiring-LEG_26_27_28.PNG)</center>
# ANKLE CABLING

> Those 2 cables are only one some previous iCub design V1.

## ANKLE FLEXION - Cable 15

> Follow the following diagram in order to rewire correctly.

|ANKLE FLEXION - cable 15 | ANKLE FLEXION - cable 16|
| ---| --- |
|<center>![waist](../img/waist/15-wiring.png)</center>|<center>![waist](../img/waist/16-wiring.png)</center>|

!!! TIP
    remove the blocker-cover to adjust the cable - when finally wired put it back and tighten firmly the screws holding it in place.
    
|ANKLE FLEXION - cable 15 | ANKLE FLEXION - cable 16|
| ---| --- |
|<center>![waist](../img/waist/cover-15.png)</center>|<center>![waist](../img/waist/cover-16.png)</center>|


# STAND – FAST ROBOT LOCKER 

> This chapter describes the construction of fast locker to connect the robot to the stand seat
> [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position029)

## STAND  - Cable 29 

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