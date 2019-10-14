# Shoulder & Elbow

This chapter describes the wiring procedure for the cables of the shoulders and elbows, for every version of iCub made from version 1 to version 2.5, either in mounting phase or during a maintenance.\ [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position001)  

<!--
Spalle e gomiti
Il presente Capitolo descrive la procedura di cablaggio dei cavi delle spalle e dei gomiti di tutte le versioni dei Robot realizzati dalla versione 1 alla versione 2.5, sia in fase di costruzione che in fase di manutenzione
-->

## 1. Cable Construction

<center>![ICUB_SHOULDER_cables_all](img/shoulder/ICUB_SHOULDER_cables_all.png)</center>
<center> 1  : length 272 mm - Diam. 1.5/1.75</center>
<center> 2  : length 256 mm - Diam. 1.5/1.75</center>
<center> 3  : length 279 mm - Diam. 1.5/1.75 </center>
<center> 4  : length 250 mm - Diam. 1.5/1.75</center>
<center> 5  : length 235 mm - Diam. 1.5/1.75</center>
<center> 6  : length 136 mm - Diam. 1.5/1.75</center>
<center> 7  : length 163 mm - Diam. 1.2/1.50</center>
<center> 8  : length 121 mm -  Diam. 1.2/1.50</center>
<center> 9  : length 110 mm - Diam. 1.2/1.50</center>
<center> 10: length 154 mm - Diam. 1.2/1.50</center>



> Cables from 1 to 6 are RC_IIT_019_G_00X - X from 1 to 6 - each made of U7191517 (IITCODE 2390) with different lengths (see the list above) and 2 crimps RC_TLR_003_P_101 (IITCODE 3492). The assembly resulting cable can be purchased from with IITCODE from 4758 to 4763.\  [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position002)
<!-- 
Gli IITCODE dei cavi da 1 a 6 sono da 4758 a 4763. Vengono realizzati mediante cavo di acciaio U7191517 codice IIT 2390 e n. 2 crimp codice IIT 3492. Le misure sono presenti nella lista
-->

|IITCODE   |Alias |Description      |
|---|---|---|
|4758|RC_IIT_019_G_001|SHOULDER ROTATION CABLE 1|
|4759|RC_IIT_019_G_002|SHOULDER ROTATION CABLE 2|
|4760|RC_IIT_019_G_003|SHOULDER ROTATION CABLE 3|
|4761|RC_IIT_019_G_004|SHOULDER ROTATION CABLE 4|
|4762|RC_IIT_019_G_005|SHOULDER ROTATION CABLE 5|
|4763|RC_IIT_019_G_006|SHOULDER ROTATION CABLE 6|
|2390   |U7191517|Stainless steel microcable, cable construction 7x19mm, nom. dia 1,5mm, outer dia 1,75mm, Polyamide coated, AISI 316 - CARL STAHL GMBH   |
|3492   |RC_TLR_003_P_101  |Thimble for cable 1.75mm (Diam int/ext/L 1.6/4.6/6 mm) - material X5CrNiMo1712 - AISI 316   |
|1895|IIT_003_P_006_00|LEFT PULLEY - CRIMP COVER|
|1896|IIT_003_P_007_00 |RIGHT PULLEY - CRIMP COVER|


> For Cable 7-8-9-10 measures see above (respectively IITCODE from 13736 to 13739). **Alternatively you could build your own, made from U7191215 (IITCODE 2389) and 2 crimps (IITCODE 3877) BUT note that it is really important to shrink down to 4mm the crimp that will be inside the tensionner holder** \ [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position003)

<!-- 
Per i cavi 7-8-9-10 fare riferimento a descrizione in IITCODE 13736-7-8-9
-->

|IITCODE   |Alias|Description      |
|---|---|---|
|13736|RC_IIT_019_G_029|U7191215/SE000094 - 163mm - cyl. nipple AM420716/NI000007 - ball nipple KU000012 - CARL STAHL GMBH|
|13737|	RC_IIT_019_G_030|U7191215/SE000094 - 121mm - cyl. nipple AM420716/NI000007 - ball nipple KU000012 - CARL STAHL GMBH|
|13738|RC_IIT_019_G_031 |U7191215/SE000094 - 110mm - cyl. nipple AM420716/NI000007 - ball nipple KU000012 - CARL STAHL GMBH|
|13739|	RC_IIT_019_G_032 |U7191215/SE000094 - 154mm - cyl. nipple AM420716/NI000007 - ball nipple KU000012 - CARL STAHL GMBH|
|2389| U7191215 |Stainless steel microcable, cable construction 7x19mm, nom. dia 1,2mm, outer dia 1,5mm, Polyamide coated, AISI 316 - CARL STAHL GMBH|
|3877| RC_TLR_005_P_101 |Thimble for cable Dia 1.5mm (Inner dia 1.25mm)|


!!! danger "The cabling sequence for the shoulder is the following:"
    <h4><center>**(1 - 2) - (3 - 4) - (8 - 7) - (6 - 5)**</center></h4>

<!--
Consiglio
La sequenza del  cablaggio dei cavi spalla è la seguente:   Cavo n. (1-2) - (3-4) - (8-7) - (6-5)
-->

## 2. Left Shoulder

<img src='../img/shoulder/ICUB_SHOULDER_LEFT.png' width = 95%>


!!! note "Rules for a good start"
    1.Always remove the broken cable

    2.Pay attention of putting the tensionner upside down so that the crimp dont exit
    
    3a.Keep in Mind that the shoulder is a set of 4 pairs of antagonistic cables : (1-2), (3-4), (8-7), (6-5)
    
    3b.And by so,to put back in place one pair of cable you need to make sure that the tensionner for both cables are loose


|**Block of pulleys**|**Tensionner fully opened**|**Cavity of the tensionner hidden - crimp can't escape**|
|:-----:|:-----:|:-----:|
|<img src ='../img/shoulder/block_pulleys.png' height = 400px width = auto>|<img src ='../img/shoulder/tensionner.png'height=400px width = auto>|<img src ='../img/shoulder/tensionner_UPSIDEDOWN.png' height=400px width = auto>|

### 2.1 Left Shoulder Rotation Cable 1 and 2

![ICUB_SHOULDER_LEFT](img/shoulder/ICUB_SHOULDER_LEFT_Cable_1.png)

> Follow the diagram above to route the cable N1. ONce the head of the crimp reach the small pulley. Add atop of it the left crimp cover in ABS
(IIT CODE: 1895)[<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position006)

|**Crimp cover above the small pulley**|**Left crimp cover**|
|:-----:|:-----:|
|<img src ='../img/shoulder/left_crimp_cover_on_pulleys.png' height = 350px width = auto>|<img src ='../img/shoulder/L_crimp_cover.png' height=300px width = auto>|

<!--
Una volta cablato   il cavo, nel passaggio del cavo attorno alla puleggia piccola   RC_TLR_003_P_037 posizionare il copri cavo in abs (plastica) ovvero il   pezzo  IIT_003_P_006_00 SX
-->

!!! Danger
    You need to remove both tensionner of cable 2 and 3 in order to change one of them - meaning recabling pairs (1-2) and (3-4)

<center><img src='../img/shoulder/ICUB_SHOULDER_LEFT_Cable_2.png' width=90%></center> 

> Route cable N2 as per the diagram above.
> 
> Now you can tense both screws for tension cable 1 and 2

!!! TIP
    Do cycles of 5 turns for each screws in order to find an equal tensionning
    
### 2.2 Left Shoulder Elevation Cable 3 and 4

<center><img src ='../img/shoulder/ICUB_SHOULDER_LEFT_Cable_3.png' width = 85%></center>
> As per cable N1, just route cable N3 following the diagram above and prevent the crimp from escaping by adding the left cover crimp (IITCODE : 1895)\ [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position006)

<!--
Una volta cablato   il cavo, nel passaggio del cavo attorno alla puleggia piccola   RC_TLR_003_P_037 posizionare il copri cavo in abs (plastica) ovvero il   pezzo  IIT_003_P_006_00 SX
-->

<center><img src='../img/shoulder/ICUB_SHOULDER_LEFT_Cable_4.png'  width=85%></center>
> Route cable N4 as per the diagram above.
> 
> Now you can tense both screws for tension cable 3 and 4

!!! TIP
    Do cycles of 5 turns for each screws in order to find an equal tensionning

### <u>IMPORTANT NOTES</u> for Cable from 8 to 5

!!! danger "From cable 8 to 5"
    **To mount the cables 8 - 7 - 6 - 5, it is important to start with all of them already disconnected. You   first need to replace the broken cable(s) by starting to enter the head crimp   (4mm size – smaller one or ball crimp) of the cable 7 and 8 inside their respective   tensioner. You will need later to start wiring cable 7 and 8 in their future   path BUT to do so it is necessary to create SPACE FOR THE CRIMPS TO PASS.**
    
    **There are 2 designs for the   shoulder so it is necessary to see the difference in between both of them to know how to untighten the good pieces and screws to create that SPACE**\ [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position007)

<h3>VERSION 1</h3>
<center>![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_LEFT_Cable_5-6-7-8.png)</center>
> 1. Remove the beige pulley (remove the 4 screws M2x12) until you dont remount cable 5
> 2. Reach the 2 screws M4x12 on the green pulley and just untighten them until you can pass both crimp 8 and 7 following the routing explain below.
> 3. Close the gap in order to prevent the cables 8 and 7 to exit - tighten the 2 screws M4x12
> 4. Start wiring

<h3>VERSION 2</h3>
![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_LEFT_Cable_5-6-7-8_V2.png)

> 1. Loose the the 2 screws M4x12 to slide a bit the block of 2 pulleys (grey and yelow) to give space until you can pass both crimp 8 and 7 following the routing explain below.
> 2. Close the gap in order to prevent the cables 8 and 7 to exit - tighten the 2 screws M4x12
> 3. Start wiring

### 2.3 Left Shoulder Elevation Cable 8 and 7

<center><img src ='../img/shoulder/ICUB_SHOULDER_LEFT_Cable_8.png'  width="95%"></center>

<center><img src='../img/shoulder/ICUB_SHOULDER_LEFT_Cable_7.png' width="90%" height="auto"></center>

> Once both crimps jumped over the 2 teeth holding the crimp in position - you can start tightening the screws of the tensionners 7 and 8.

### 2.4 Left Shoulder Elevation Cable 6 and 5

> Those 2 cables are quite straight forward to mount, just follow the 2 following pictures.

<center>![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_LEFT_Cable_6.png)</center>             
<center>![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_LEFT_Cable_5.png)</center>
> Once both crimps jumped over the 2 teeth holding the in position you can start tightening the screws of the tensionnes 6 and 5

## 3. Left Elbow cabling 

> Those 2 cables are not specifically difficult to route but unfortunately you need to operate cautiously to do NOT damage the electronical boards located beneath the upper arm.

<img src='../img/shoulder/ICUB_ELBOW_LEFT.png' width = 80%>

!!! warning
    **EITHER** you remove the Lower Arm by Following the instructions for Lower Arm [**V1**](remove.md#position001) or Lower Arm [**V2**](remove.md#position002)
    
    **OR** You are heped by **someone else** to hold the Lower Arm (Forearm + Hand).
    

<center>![ICUB_ELBOW](img/shoulder/ICUB_Elbow_LEFT_Cable_9-10.png)</center> 

!!! tip "Rules of routing"
    1. Remove the lower part of the upper arm cover if  NOT done yet
    2. Remove the lateral plate (the **ONE** with **NO** sensor) by unmounting the 2 screws holding it.
    3. Turn the main shaft by the help of a screw driver to apply enough torque to make it spin, until you reach the same situation as the pictures above (this is the view from **below** of the elbow)
    4. Replace the broken cable(s) by starting to enter the head crimp   (4mm size – smaller one or ball crimp) of the cable 9 and 10 inside their respective tensioner.
    5. Pass both heads of crimp before reattaching the Lateral Plate.
    6. Position the head of crimp in their socket
    7. start tightening the screws of both tensionner.





## 4. Right Shoulder

!!! advice
    Take  look at the beginning of this web page to have all the information related to the dimensions of cables and how to get or build them.


!!! danger "The cabling sequence for the shoulder is the following:"
    <h4><center>**(1 - 2) - (3 - 4) - (8 - 7) - (6 - 5)**</center></h4>

<!--
Consiglio
La sequenza del  cablaggio dei cavi spalla è la seguente:   Cavo n. (1-2) - (3-4) - (8-7) - (6-5)
-->

<img src='../img/shoulder/ICUB_SHOULDER_RIGHT.png' height=500px width = auto>


!!! note "Rules for a good start"
    1.Always remove the broken cable

    2.Pay attention of putting the tensionner upside down so that the crimp dont exit
    
    3a.Keep in Mind that the shoulder is a set of 4 pairs of antagonistic cables : (1-2), (3-4), (8-7), (6-5)
    
    3b.And by so,to put back in place one pair of cable you need to make sure that the tensionner for both cables are loose


|**Block of pulleys**|**Tensionner fully opened**|**Cavity of the tensionner hidden - crimp can't escape**|
|:-----:|:-----:|:-----:|
|<img src ='../img/shoulder/block_pulleys.png' height = 400px width = auto>|<img src ='../img/shoulder/tensionner.png'height=400px width = auto>|<img src ='../img/shoulder/tensionner_UPSIDEDOWN.png' height=400px width = auto>|

### 4.1 Right Shoulder Rotation Cable 1 and 2

![ICUB_SHOULDER_LEFT](img/shoulder/ICUB_SHOULDER_RIGHT_Cable_1.png)

> Follow the diagram above to route the cable N1. ONce the head of the crimp reach the small pulley. Add atop of it the right crimp cover in ABS
(IIT CODE: 1896)[<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position006)

|**Crimp cover above the small pulley**|**Right crimp cover**|
|:-----:|:-----:|
|<img src ='../img/shoulder/right_crimp_cover_on_pulleys.png' width = 300px>|<img src ='../img/shoulder/R_crimp_cover.png' width = 300px>|

<!--
Una volta cablato   il cavo, nel passaggio del cavo attorno alla puleggia piccola   RC_TLR_003_P_037 posizionare il copri cavo in abs (plastica) ovvero il   pezzo  IIT_003_P_006_00 SX
-->

!!! Danger
    You need to remove both tensionner of cable 2 and 3 in order to change one of them - meaning recabling pairs (1-2) and (3-4)

![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_RIGHT_Cable_2.png) 

> Route cable N2 as per the diagram above.
> 
> Now you can tense both screws for tension cable 1 and 2

!!! TIP
    Do cycles of 5 turns for each screws in order to find an equal tensionning
    
### 4.2 Right Shoulder Elevation Cable 3 and 4

<center><img src ='../img/shoulder/ICUB_SHOULDER_RIGHT_Cable_3.png' width = 85%></center>
> As per cable N1, just route cable N3 following the diagram above and prevent the crimp from escaping by adding the right cover crimp (IITCODE : 1896)\ [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position006)

<!--
Una volta cablato   il cavo, nel passaggio del cavo attorno alla puleggia piccola   RC_TLR_003_P_037 posizionare il copri cavo in abs (plastica) ovvero il   pezzo  IIT_003_P_006_00 SX
-->

<center><img src='../img/shoulder/ICUB_SHOULDER_RIGHT_Cable_4.png'  width=85%></center>
> Route cable N4 as per the diagram above.
> 
> Now you can tense both screws for tension cable 3 and 4

!!! TIP
    Do cycles of 5 turns for each screws in order to find an equal tensionning

### <u>IMPORTANT NOTES</u> for Cable from 8 to 5

!!! danger "From cable 8 to 5"
    **To mount the cables 8 - 7 - 6 - 5, it is important to start with all of them already disconnected. You   first need to replace the broken cable(s) by starting to enter the head crimp   (4mm size – smaller one or ball crimp) of the cable 7 and 8 inside their respective   tensioner. You will need later to start wiring cable 7 and 8 in their future   path BUT to do so it is necessary to create SPACE FOR THE CRIMPS TO PASS.**
    
    **There are 2 designs for the   shoulder so it is necessary to see the difference in between both of them to know how to untighten the good pieces and screws to create that SPACE**\ [<i class="fa fa-flag fa-1x"></i> **ITA**](italiano.md#position007)

<h3>VERSION 1</h3>
<center>![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_RIGHT_V1.png)</center>
> 1. Remove the beige pulley (remove the 4 screws M2x12) until you dont remount cable 5
> 2. Reach the 2 screws M4x12 on the green pulley and just untighten them until you can pass both crimp 8 and 7 following the routing explain below.
> 3. Close the gap in order to prevent the cables 8 and 7 to exit - tighten the 2 screws M4x12
> 4. Start wiring

<h3>VERSION 2</h3>
![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_RIGHT_V2.png)

> 1. Loose the the 2 screws M4x12 to slide a bit the block of 2 pulleys (grey and yelow) to give space until you can pass both crimp 8 and 7 following the routing explain below.
> 2. Close the gap in order to prevent the cables 8 and 7 to exit - tighten the 2 screws M4x12
> 3. Start wiring

### 4.3 Right Shoulder Elevation Cable 8 and 7

<center><img src ='../img/shoulder/ICUB_SHOULDER_RIGHT_Cable_8.png'  width="90%"></center>

<center><img src='../img/shoulder/ICUB_SHOULDER_RIGHT_Cable_7.png' width="90%" height="auto"></center>
> Once both crimps jumped over the 2 teeth holding the crimp in position - you can start tightening the screws of the tensionners 7 and 8.

### 4.4 Right Shoulder Elevation Cable 6 and 5

> Those 2 cables are quite straight forward to mount, just follow the 2 following pictures.

<center>![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_RIGHT_Cable_6.png)</center>             
<center>![ICUB-SHOULDER](img/shoulder/ICUB_SHOULDER_RIGHT_Cable_5.png)</center>
> Once both crimps jumped over the 2 teeth holding the in position you can start tightening the screws of the tensionnes 6 and 5

## 5. Right Elbow cabling 

> Those 2 cables are not specifically difficult to route but unfortunately you need to be cautious to procede undamaging the electronical board located beneath the upper arm.

<img src='../img/shoulder/ICUB_ELBOW_RIGHT.png' width = 80%>

!!! warning
    **EITHER** you remove the Lower Arm by Following the instructions for Lower Arm [**V1**](remove.md#position001) or Lower Arm [**V2**](remove.md#position002)
    
    **OR** You are heped by **someone else** to hold the Lower Arm.
    

<center>![ICUB_ELBOW](img/shoulder/ICUB_Elbow_RIGHT_Cable_9-10.png)</center> 

!!! tip "Rules of routing"
    1. Remove the lower part of the upper arm cover if  NOT done yet
    2. Remove the lateral plate (the **ONE** with **NO** sensor) by unmounting the 2 screws holding it.
    3. Turn the main shaft by the help of a screw driver to apply enough torque to make it spin, until you reach the same situation as the pictures above (this is the view from **below** the elbow)
    4. Replace the broken cable(s) by starting to enter the head crimp   (4mm size – smaller one or ball crimp) of the cable 9 and 10 inside their respective tensioner.
    5. Pass both heads of crimp before reattaching the Lateral Plate.
    6. Position the head of crimp in their socket
    7. start tightening the screws of both tensionner.





| Version | Date         | Author                     | Comments                 |
| ------- | ------------ | -------------------------- | ------------------------ |
| 0.1     | 24 Jan 2017  | A. Spadoni                 | First emission           |
| 0.2     | 8 Mar 2017   | A. Spadoni, <br/>A. Parmiggiani | Document revision   |
| 0.3     | 20 July 2017 | J. Jenvrin                 | For emission             |
| 0.4     | 20 Feb 2019  | J. Jenvrin                 | Modification cabling N14 |
| 0.5     | 26 Sep 2019  | M. Borgagni                | Work on MD |
|0.6|14 Oct 2019| J. Jenvrin|Add Rules, Tricks and Tips|
