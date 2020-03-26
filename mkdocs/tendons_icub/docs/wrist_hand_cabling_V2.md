!!! NOTE "SUM UP"
    Updating the forearm in V2 had had for consequences the following changes compared to the wiring of the V1 - Please refer to this manual to compel with the new attributes.

# 1	WRIST

## 1.1  WRIST TENDONS LENGTH

Here is the list of the 10 tendons needed to build the wrist movements.

<center>
<img src= "/../img/HAND_WRIST_V2/ICUB_Tendon_Left_Right.png">



|Tendon   |IITCODE   |Length   |Alias   |
|---|---|---|---|
| 1 | 6400 | 72 mm | RC_IIT_019_G_019 |
| 2 | 6402 | 84 mm | RC_IIT_019_G_020 |
| 3 | 6404 | 101 mm | RC_IIT_019_G_021 |
| 4 | 6413 | 124 mm | RC_IIT_019_G_022 |
| 5 | 6414 | 107 mm | RC_IIT_019_G_023 |
| 6 | 6415 | 113 mm | RC_IIT_019_G_024 |
| 7 | 6416 | 112 mm | RC_IIT_019_G_025 |
| 8 | 6417 | 107mm | RC_IIT_019_G_026 |
| 9 | 6418 | 51 mm | RC_IIT_019_G_027 |
| 10 | 6419 | 43 mm | RC_IIT_019_G_028 |


</center>

## 1.2 Wrist motor tendons
### 1.2.1	Location and Identification
From the pictures below you will be able to locate and identify the 8 tendons inside the **Right Forearm** building the active part of the wrist tendons.

<center>
    <img src="/../img/HAND_WRIST_V2/R_4RM_A.png" width = 110%>
	<img src= "/../img/HAND_WRIST_V2/R_4RM_B.png" width = 130%>
</center>

From the pictures below you will be able to locate and identify the 8 tendons inside the **Left Forearm** building the active part of the wrist tendons.

<center><img src="/../img/HAND_WRIST_V2/L_4RM_A.png" width = 120%></center>

<center><img src= "/../img/HAND_WRIST_V2/L_4RM_B.png" width = 130%></center>

### 1.2.2	Cabling

In the case you found out 1 of the 8 first cables of the wrist broken, here the sequence  you need to follow to restore the it.

| pictures | step by step guide|
| --- | --- |
| <img src="/../img/HAND_WRIST_V2/R_4RM_A.png" width = 110%><img src= "/../img/HAND_WRIST_V2/R_4RM_B.png" width = 150%> | <u>FIRST THING FIRST:</u> </br>which side of the wrist is broken?<br/> the internal (refer to cables 1 to 4) or the external <br/>one (refers to cables 5 to 8)? </br>Can you see the differences?</br>YOU may have guessed on your own but the answer<br/> is only that the external one is beneath<br/> the 3 proximal motors which makes it more <br/>complicated to reach and repair apart from<br/> that it is **exactly identical** - so to proceed <br/>we will first see how to move the proximal <br/>motor if you need to repair the external wrist motor<br/> and follow up with the explanation <br/>of the tendon in a more generical way <br/>as both motor are wired the same way.</br>**If you need to repair tendons from 1 to 4 <br/>please just proceed to STEP 2** |
| <img src= "/../img/HAND_WRIST_V2/Prox_screws1.png" width = 130%> | <u>STEP 1:</u> <br/> remove the 6 screws M1.6x5 and flip over the 3 motors to be able to access visually the motor beneath them. |
| <img src= "/../img/HAND_WRIST_V2/wrist_int_screws.png" width = 130%> | <u>STEP 2:</u> <br/> remove the 2 screws M2.5x10 holding the motor<br/>from now on you can work freely |
| <img src= "/../img/HAND_WRIST_V2/Tensioner_description.png" width = 130%> | <u>STEP 3:</u> <br/>remove the broken part of the cable still inside the tensioner <br/> !!!WARNING!!! <br/>once remove, either you put back the brand new cable inside or else just simply gather the part removed from the tensioner assembly and re-screw it back in until further notice in order to DO NOT LOSE PIECES!!! |
| <img src= "/../img/HAND_WRIST_V2/wrist_crimp_removal.png" width = 130%><br/><img src= "/../img/HAND_WRIST_V2/wrist_AEA_stand.png" width = 130%> | <u>STEP4:</u> <br/>At the level of the wrist pulley, just remove the broken cable and replace it : <br/>EASY for cable 5 and 6 BUT LESS EASY for cable 1 and 2, <br/>you need to remove the mechanical part <br/>preventing you from inserting and removing the head crimp. <br/> To do so, just remove the 2 screws M2x6 <br/>and slide the block to retrieve and replace the head crimp<br/>Once done, put back on place the block and the 2 screws |
| | We can now start wiring!!! |
| <img src= "/../img/HAND_WRIST_V2/turn_pulley1.png" width = 130%><br/><img src= "/../img/HAND_WRIST_V2/turn_pulley2.png" width = 130%> | <u>STEP 5:</u> <br/> Let's begin with the motor pulley, here is the way to wire  them both (as they are perfectly identical) |
| put a picture showing that | <u>STEP 6:</u> <br/>put a 2 tie wraps one for each side (or cable) in order to prevent them from getting untwisted. |
| picture motor almost closed on support | <u>STEP 7:</u><br/>Put back in place the motor with its 2 screws M2.5x10. Leave 1mm in between the motor and the support. We will cover this aspect later |
|  | <u>STEP 8:</u><br/>let's wire the wrist pulleys (either for 1,2 or 5,6) |
|  |  |
|  |  |
|  |  |
|  |  |



## 1.3  Wrist - Passive tendons

### 1.3.1	Location and Identification

From the pictures below you will be able to locate and identify the 2 tendons inside both the **Right Wrist** and **Left Wrist** building the passive part of the wrist movements.

| RIGHT WRIST                                         | LEFT WRIST                                          |
| --------------------------------------------------- | --------------------------------------------------- |
| <img src="../img/HAND_WRIST_V2/R_wrist_label.png" > | <img src='../img/HAND_WRIST_V2/L_wrist_label.png' > |
| <img src="../img/HAND_WRIST_V2/R_cabling_wrist1.png" > |<img src="../img/HAND_WRIST_V2/L_cabling_wrist1.png" > |
|<img src="../img/HAND_WRIST_V2/R_cabling_wrist2.png" > |<img src="../img/HAND_WRIST_V2/L_cabling_wrist2.png" > |
|<img src="../img/HAND_WRIST_V2/R_cabling_wrist3.png" > |<img src="../img/HAND_WRIST_V2/L_cabling_wrist3.png" > |

### 1.3.2	Cabling

Here the sequence  you need to follow to restore the 2 little cables from the base of the wrist - we will write down the procedure using the left arm as base pictures but used the previous pictures above to mirror the explanations.

|pictures|step by step procedure|
| --- | --- |
|<img src="../img/HAND_WRIST_V2/wrist_tensionner.png" ></br><img src="../img/HAND_WRIST_V2/wrist_screws.png" > </br>|!!!KEEP IN MIND - whenever you need to replace one of the 2 cables you **FIRST** need to release the tensionners </br> <u>CABLE 10:</u> </br> it is really straight forward - just put one side of the crimp of cable 10 inside the tensionner (blue cirle) and put the other side inside the holding tooth|
|<img src="../img/HAND_WRIST_V2/crimp_screw.png" >| <u>cable 9: </u> </br> it is just a tiny whinny more complicated because you need to first remove the screw to be able to lodge the crimp inside the tensionner and reput back in place the tensionner in the throat and insert the screw|
|<img src="../img/HAND_WRIST_V2/up_down.png" >| Once done: </br>3. tighten the screws of both tensionner until you reach a strict tensing on the cables|

# 2	Hand Wiring

!!! NOTE "SUM UP"
    You will find below a certain amount of pictures illustrating the changes or helping you to individuate the cabling and labelling of the different sheaths located in the hand.



## 2.1  Thumb Oppose

     Left palm, view from top - S0 and S2 cable from the thumb oppose

<img src="../img/HAND_WRIST_V2/Opposite_palm-view.png" width="700">

!!!NOTE
    The Right Thumb oppose sheath are the exact same just mirrored so the rule of the longest (S2) and the shortest (S0) is still the same.



## 2.1 Left THUMB



Here, you will find some rues to individuate the wiring and sheath for the wiring of the thumb oppose, the thumb proximal and distal.

<img src="../img/HAND_WRIST_V2/Thumb1.png">

<img src="../img/HAND_WRIST_V2/Thumb2.png">

<img src="../img/HAND_WRIST_V2/Thumb3.png">

## 2.2  Thumb Metacarpus sheath positions

<img src="../img/HAND_WRIST_V2/Metacarpus.png">

!!! WARNING "REMINDER"
    The following list of sheaths are made from IITCODE :2375 - Open spiral spring, inox steel AISI302, D ext= 1.6mm, D wire= 0.25mm – L = 500 mm:
    	- Distal Thumb
    	- Short Distal Thumb
    	- Short Prox Thumb


