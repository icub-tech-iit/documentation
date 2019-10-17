# **Wrist Cabling**

<img src="../img/underreview.jpg" style="zoom:50%;" />

Nori Francesco

Genova 28th January 2008

 

TOOLS TO BE USED

\-         coated steel wire (Cod U7194561 Carl Stahl)

\-         set of small screwdrivers

\-         cyanoacrylic glue

\-         steel wire cutter

\-         set of hexagonal screw drivers

\-         power grippers

\-         tensioners (open cable version: CAD code ??????????)

 


> In this document we describe how to cable the wrist. The wrist movements (roll, pitch and yaw) are achieved with three motors located in the forearm. The wrist roll (or pronosupination) is achieved directly, i.e. without any cable driven joint.

 

> The wrist pitch and yaw are instead cable driven. The actuation is achieved with two motors which jointly collaborate to the pitch and yaw degrees of freedom. The actuation is differential with the following relationship:

 

> wrist_pitch = M1

> wrist_yaw = M1 + M2

 

> where M1 and M2 are the angular positions of the the two motors contributing to the movements. We have:

 

>**RIGHT_ARM**

>M1: angular position of 2B2M1

>M2: angular position of 2B2M2

 

>**LEFT_ARM**

>M1: angular position of 1B2M1

>M2: angular position of 1B2M2

 

 

## 1. M1 (wrist_pitch and wrist_yaw): SxWrPy and DxWrPy

 

| **WrPy** |                                   |
| -------- | --------------------------------- |
| Motor    | 1B2M1 (SxWrPy) and 2B2M1 (DxWrPy) |
| Cable    | Carl Stahl CG077063               |
|          |                                   |

 

>Pictures:

>**Joint pulley (with holes visible).**

>1.	Take a piece of uncoated cable (more or less 20 cm). Let its extremities be E1 and E2.
2.	Pass the cable trough the hole (H) in the pulley.
3.	Block the cable on the hole H with some cyanoacrylic glue.
4.	Twine the cable on the pulley. The number of turns around the pulley has to be decided on the basis of the entrance and exit pulleys (P1 and P2): the cable should be tangential to the pulleys.
5.	Block the cable on the motor with some tape. This will allow you to maintain the cable positioned on the pulley.
6.	Take a piece of cable. Tie in a knot at one extremity. Take the other extremity (E3) and pass it trough the hole H1 on the pulley P3. Exit the pulley trough the hole H2.
7.	Take a tensioner and remove the left-hand (LHS1) and the right-hand screws (RHS1). 
8.	Remove E1 from the tape that blocks it on the motor.
9.	Pass E3 trough the hole in LHS1. Pass E1 through the hole in RHS1.
10.	Tie in a knot (KN1) on E1. This knot should be positioned so as to have the tensioner in the middle of the admissible range of movements.
11.	Tie in a knot (KN3) on E3. This knot should be positioned taking into account the length of the tensioner.
12.	Twine the cable E3 on the pulley P3 (see the picture). Screw LHS1 and RHS1 on the tensioner.
13.	Take a piece of cable. Tie in a knot at one extremity. Take the other extremity (E4) and pass it trough the hole H3 on the pulley P3. Exit the pulley trough the hole H4.
14.	Take a tensioner and remove the left-hand (LHS2) and the right-hand screws (RHS2). 
15.	Remove E2 from the tape that blocks it on the motor.
16.	Pass E4 trough the hole in LHS1. Pass E2 through the hole in RHS1.
17.	Tie in a knot (KN2) on E2. This knot should be positioned so as to have the tensioner in the middle of the admissible range of movements.
18.	Tie in a knot (KN4) on E4. This knot should be positioned taking into account the length of the tensioner.
19.	Twine the cable E4 on the pulley P3 (see the picture). Screw LHS2 and RHS2 on the tensioner.

!!! TIPS

    In order to increase the cable tension it is useful to unscrew the screws S1 and S2. After having completed all the described operations the cable tension can be increased by tightening the screws S1 and S2.

| | |
|--|--|
|<img src ="../img/wrist/FIG1_1B2M1.PNG" height = 300> |<img src ="../img/wrist/FIG2_2B2M1.PNG" height = 300>|

<center><img src ="../img/wrist/FIG3_globale.PNG" height = 650 width = auto></center>

| | |
|--|--|
|<img src ="../img/wrist/FIG4_H2.PNG" height = 300> | <img src ="../img/wrist/FIG5_H4.PNG" height = 300>
|<img src ="../img/wrist/FIG6_H1_H4.PNG" height = 300> | <img src ="../img/wrist/FIG7_H2_H4.PNG" height = 300>
|<img src ="../img/wrist/FIG8_RHS1.PNG" height = 300> | <img src ="../img/wrist/FIG9_RHS2.PNG" height = 300>|

## **2. M2 (wrist_yaw): SxWrYw and DxWrYw**

| **WrYw** |                                   |
| -------- | --------------------------------- |
| Motor    | 1B2M2 (SxWrYw) and 2B2M2 (DxWrYw) |
| Cable    | Carl Stahl CG077063               |
|          |                                   |


1. Take a piece of      uncoated cable (more or less 20 cm). Let its extremities be E1 and E2.
2. Pass the cable      trough the hole (H) in the pulley.
3. Block the cable on      the hole H with some cyanoacrylic glue.
4. Twine the cable on      the pulley. The number of turns around the pulley has to be decided on the      basis of the entrance and exit pulleys (P1 and P2): the cable should be      tangential to the pulleys.
5. Block the cable on      the motor with some tape. This will allow you to maintain the cable      positioned on the pulley.
6. Take a piece of      cable. Tie in a knot at one extremity. Take the other extremity (E3) and      pass it trough the hole H1 on the pulley P3. Exit the pulley trough the      hole H2.
7. Take a tensioner and      remove the left-hand (LHS1) and the right-hand screws (RHS1). 
8. Remove E1 from the      tape that blocks it on the motor.
9. Pass E3 trough the      hole in LHS1. Pass E1 through the hole in RHS1.
10. Tie in a knot (KN1)      on E1. This knot should be positioned so as to have the tensioner in the      middle of the admissible range of movements.
11. Tie in a knot (KN3)      on E3. This knot should be positioned taking into account the length of      the tensioner.
12. Twine the cable E3      on the pulley P3 (see the picture). Screw LHS1 and RHS1 on the tensioner.
13. Take a piece of      cable. Tie in a knot at one extremity. Take the other extremity (E4) and      pass it trough the hole H3 on the pulley P3. Exit the pulley trough the      hole H4.
14. Take a tensioner and      remove the left-hand (LHS2) and the right-hand screws (RHS2). 
15. Remove E2 from the      tape that blocks it on the motor.
16. Pass E4 trough the      hole in LHS1. Pass E2 through the hole in RHS1.
17. Tie in a knot (KN2)      on E2. This knot should be positioned so as to have the tensioner in the      middle of the admissible range of movements.
18. Tie in a knot (KN4)      on E4. This knot should be positioned taking into account the length of      the tensioner.
19. Twine the cable E4      on the pulley P3 (see the picture). Screw LHS2 and RHS2 on the tensioner.


!!!TIPs
    In order to increase the cable tension it is useful to unscrew the screws S1 and S2. After having completed all the described operations the cable tension can be increased by tightening the screws S1 and S2.


| | |
|--|--|
|<img src ="../img/wrist/FIG10_1B2M2.PNG" height = 300> |<img src ="../img/wrist/FIG11_2B2M2.PNG" height = 300>|

<center><img src ="../img/wrist/FIG12_globale.PNG" height = 650 width = auto></center>

| | |
|--|--|
|<img src ="../img/wrist/FIG13_RHS1.PNG" height = 300> | <img src ="../img/wrist/FIG14_RHS2.PNG" height = 300>
|<img src ="../img/wrist/FIG15_H1_H3.PNG" height = 300> | <img src ="../img/wrist/FIG16_H2_H3.PNG" height = 300>
|<img src ="../img/wrist/FIG17_H4a.PNG" height = 300> | <img src ="../img/wrist/FIG18_H4b.PNG" height = 300>|

## **3. wrist_yaw and wrist_pitch coupling**

| **---** |                     |
| ------- | ------------------- |
| Motor   | --                  |
| Cable   | Carl Stahl CG077063 |
|         |                     |


>1. Take a piece of uncoated cable (more or less 10 cm). Let its extremities be E1 and E2
2. Take the tensioner      (Te1) out of its socket by removing the screw S1.
3. Tie in a knot at E2.
4. Pass E1 through the      hole in the tensioner Te1. Pull the cable so that the knot will block the cable.
5. Pass E1 through the      hole H1 on the pulley.
6. Put S1 back in place      but leave the tensioner close to H1.
7. Follow the cable      path until the stopper St1.
8. Remove the stopper      St1 by unscrewing S2.
9. Pull the cable and      block it with the stopper St1 and with screw S2. Tie in a knot in order to      prevent any cable slippage.
10. Take a piece of      uncoated cable (more or less 10 cm). Let its extremities be E3 and E4
11. Take the tensioner      (Te2) out of its socket by removing the screw S3.
12. Tie in a knot at E4.
13. Pass E3 through the      hole in the tensioner Te2. Pull the cable so that the knot will block the      cable.
14. Pass E3 through the      hole H2 on the pulley.
15. Put S3 back in place      but leave the tensioner close to H2.
16. Follow the cable      path until the stopper St2.
17. Remove the stopper      St2 by unscrewing S4.
18. Pull the cable and      block it with the stopper St1 and with screw S4. Tie in a knot in order to      prevent any cable slippage.


| | |
|--|--|
|<img src ="../img/wrist/FIG19.PNG" height = 300> | <img src ="../img/wrist/FIG20.PNG" height = 300>
|<img src ="../img/wrist/FIG21.PNG" height = 300> | <img src ="../img/wrist/FIG22.PNG" height = 300>
|<img src ="../img/wrist/FIG24.PNG" height = 300> | <img src ="../img/wrist/FIG23.PNG" height = 300>
|<img src ="../img/wrist/FIG25.PNG" height = 300> | <img src ="../img/wrist/FIG26.PNG" height = 300>|


## **4. Broken Tendon on iCub V1**

### **4.1.	Check Correct mounting the UPPER TENDON PART (Elbow side)**

>4.1.1.	Make sure the cable is properly twined around the pulley P (red in the pic below)

<img src ="../img/wrist/Broken_tendon_1.PNG" height = 400 width = auto>

> 4.1.2.	You might have to remove the proximal motors to have a clear view on pulley P.

> 4.1.3.	If you can assess the proper twining state around P, please skip to 6. Otherwise proceed with 4.

> 4.1.4.	To remove these motors just undo the screws shown in red below.

<img src ="../img/wrist/Broken_tendon_2.PNG" height = 400 width = auto>

> 4.1.5.	You should now be able to get them out of the way (they will still be attached to their tendons) and get a clear view of the pulley. 

<img src ="../img/wrist/Broken_tendon_3.PNG" height = 500 width = auto>

> 4.1.6.	The cable should be tangential to the pulleys as shown below.

<img src ="../img/wrist/Broken_tendon_4.PNG" height = 500 width = auto>

> 4.1.7.	Block the cable on the motor with some tape. This will allow you to maintain the cable positioned on the pulley

!!! Tips
    We found ear-plugs are perfect for this scope cause they can be squeezed into position and then they will keep the tendon and prevent it from moving.
    
<img src ="../img/wrist/Broken_tendon_5.PNG" height = 500 width = auto>
 
### **4.2.	Gain some margin on cable tension**

>4.2.1 Undo the small nuts on both sides of the tensioner and undo the tensioner extremities until they are as long as possible (only couple of threads screwed into the body of the tensioner)

<img src ="../img/wrist/Broken_tendon_6.PNG" height =200 width = auto>

!!! note
    Note that RED nut and the RED extremity of the tensioner assembly are left hand-threaded (wrist side). Pay attention to the direction of turning.

>4.2.2.	Loosen the two screws that hold the motor in place. Do not remove them.

<img src ="../img/wrist/Broken_tendon_6b.PNG" height =400 width = auto>


### **4.3	Replace the broken cable (wrist side)**

>4.3.1.	Take a piece of cable 25 – 30 cm at least. Tie in a knot at one extremity. Drop some cyanoacrylate glue on the knot to make sure it will NOT get loose

>4.3.2.    Take the other extremity and pass it through the hole H1 on the pulley P3. Exit the pulley through the hole H2.

<img src ="../img/wrist/Broken_tendon_7.PNG" height =300 width = auto>

>4.3.3	Pass the wire through the tensioner and mark with a permanent marker where the knot shall fall. This knot should be positioned taking into account the length of the tensioner.

>4.3.4.	Tight a knot and fix it using the usual drop of cyanoacrylate glue.

> 4.3.5.    The tensioner should be in the middle of the admissible range of movements.


###  **4.4 Tight to perfection**

4.4.1.	Tight the tensioner by screwing in the extremities

<img src ="../img/wrist/Broken_tendon_8.PNG" height =165 width = auto>

4.4.2.	Tight back in the screw that hold the motor

<img src ="../img/wrist/Broken_tendon_9.PNG" height =400 width = auto>

### **4.5.	Conclusion**
>If the tendon is still too lose after using all the tensioner stroke and after tightening the screws you might have to start over. To find the proper level of tension compare with the other wrist.
