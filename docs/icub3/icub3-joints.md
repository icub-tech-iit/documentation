# iCub 3
Here's are described the elctrical and mechanical specifications for each joint

## Head Joints Specs

![head-0](./img/head-0.png)

### Joints 0,1 - pitch and roll (coupled)
|   |   |
|---|---|
|![head-1](./img/head-1.png) |![head-2](./img/head-2.png) |
|Motor type|DC|
|Motor Encoder|512 ppr|
|First stage reduction|18/28|
|Harmonic drive|1/100|
|Last stage (cables and pulleys reduction)|30.5/31.7|
|Joint encoder|AEA|
|HW limits|pitch -30/+41 roll +/-40 (degrees)|

### Joint 2 - yaw
|   |   |
|---|---|
|![head-3](./img/head-3.png) | |
|Motor type|DC|
|Motor Encoder|512 ppr|
|First stage reduction|-|
|Harmonic drive|1/100|
|Last stage (cables and pulleys reduction)|-|
|Joint encoder|AEA|
|HW limits|+/-45 (degrees)|

### Joint 3 - eyes tilt
|   |   |
|---|---|
|![head-4](./img/head-4.png) | |
|Motor type|DC|
|Motor Encoder|512 ppr|
|First stage reduction|-|
|Harmonic drive|1/100|
|Last stage (cables and pulleys reduction)|-|
|Joint encoder|AEA|
|HW limits|+/-45 (degrees)|

### Joint 4,5 - eyes pan
|   |   |
|---|---|
|![head-5](./img/head-5.png) | |
|Motor type|DC|
|Motor Encoder|512 ppr|
|First stage reduction|-|
|Harmonic drive|1/50|
|Last stage (cables and pulleys reduction)|-|
|Joint encoder|-|
|HW limits|+/-30 (degrees)|

## Face Joints Specs

![face-0](./img/face-0.png)

### Joint 0 - Eyelids
|   |   |
|---|---|
|![face-1](./img/face-1.png) | |
|Motor type|DC|
|Motor Encoder|10 lpr|
|Integrated gearbox|1/16|
|Joint encoder|AEA|
|Last stage reduction|42/100|
|HW limits|0/-70 (degrees)|

## Upperarm Joints specs

![upper-0](./img/upper-0.png)


### Joint 0 - shoulder pitch
|   |   |
|---|---|
|![upper-2](./img/upper-2.png) | |
|Motor type|Brushless C2900576 8 poles|
|Motor Encoder|Lcore optical encoder on motor shaft|
|Harmonic drive|1/100|
|Joint encoder|Magnetic target 64/63 & AMO board (MU7S_64-63N PWB 103839)|
|HW limits|-25/+180 (degrees)|

### Joint 1 - shoulder roll
|   |   |
|---|---|
|![upper-3](./img/upper-3.png) | |
|Motor type|Brushless C2900576 8 poles|
|Motor Encoder|Lcore optical encoder on motor shaft|
|Harmonic drive|1/100|
|Joint encoder|Magnetic target 64/63 & AMO board (MU7S_64-63N PWB 103839)|
|HW limits|-15/+150 (degrees)|

### Joint 2 - upperarm yaw
|   |   |
|---|---|
|![upper-4](./img/upper-4.png) | |
|Motor type|Brushless C2900576 8 poles|
|Motor Encoder|Lcore optical encoder on motor shaft|
|Harmonic drive|1/100|
|Joint encoder|magnetic target 64/63 & AMO board (MU7S_64-63N PWB 103839)|
|HW limits|-52/+82 (degrees)|

### Joint 3 - elbow
|   |   |
|---|---|
|![upper-5](./img/upper-5.png) | |
|Motor type|Brushless C2900576 8 poles|
|Motor Encoder|Lcore optical encoder on motor shaft|
|Harmonic drive|1/100|
|Joint encoder|magnetic target MU7S_25-32N & AMO board (MU7S_64-63N PWB 103839)|
|HW limits|-5/+115 (degrees)|

## Forearm Joints specs

![forearm-0](./img/forearm-0.png)

### Joint 4 - Pronosupination
|   |   |
|---|---|
|![forearm-1](./img/forearm-1.png) | |
|Motor type|DC|
|Motor Encoder|512 ppr|
|Harmonic drive|1/100|
|Joint encoder|-|
|HW limits|-90/+90 (degrees)|

### Joint 5,6 -Wrist yaw and pitch - coupled
|   |   |
|---|---|
|![forearm-2](./img/forearm-2.png) | |
|Motor type|DC|
|Motor Encoder|400 ppr|
|Integrated gearbox|1/159|
|Cables’pulleys reduction|14/18.8|
|Joint encoder|AEA (both joints)|
|HW limits|-45/+45 (degrees)|

### Joint 7 - Fingers abduction
|   |   |
|---|---|
|![forearm-8](./img/forearm-8.png) | |
|Motor type|DC|
|Motor Encoder|10 ppr|
|Integrated gearbox|1/256|
|Cables’pulleys reduction|-|
|Joint encoder|Hall effect sensor|

### Joint 8 - Thumb abduction
|   |   |
|---|---|
|![forearm-9](./img/forearm-9.png) | |
|Motor type|DC|
|Motor Encoder|no|
|Integrated gearbox|1/256|
|Cables’pulleys reduction|-|
|Joint encoder|Hall effect sensor|

### Joint 9,11,13 - Thumb, index and middle proximals
|   |   |
|---|---|
|![forearm-3](./img/forearm-3.png) | |
|Motor type|DC|
|Motor Encoder|10 ppr|
|Integrated gearbox|1/256|
|Cables’pulleys reduction|-|
|Joint encoder|Hall effect sensor|

### Joint 10 - Thumb distals - 2 joints 1 motor
|   |   |
|---|---|
|![forearm-4](./img/forearm-4.png) | |
|Motor type|DC|
|Motor Encoder|10 ppr|
|Integrated gearbox|1/256|
|Cables’pulleys reduction|-|
|Joint encoder|Hall effect sensor|

### Joint 12 - Index distals - 2 joints 1 motor
|   |   |
|---|---|
|![forearm-5](./img/forearm-5.png) | |
|Motor type|DC|
|Motor Encoder|10 ppr|
|Integrated gearbox|1/256|
|Cables’pulleys reduction|-|
|Joint encoder|Hall effect sensor|

### Joint 14 - Middle distals - 2 joints 1 motor
|   |   |
|---|---|
|![forearm-6](./img/forearm-6.png) | |
|Motor type|DC|
|Motor Encoder|10 ppr|
|Integrated gearbox|1/256|
|Cables’pulleys reduction|-|
|Joint encoder|Hall effect sensor|

### Joint 15 - Ring and pinky distals - 4 joints 1 motor
|   |   |
|---|---|
|![forearm-7](./img/forearm-7.png) | |
|Motor type|DC|
|Motor Encoder|10 ppr|
|Integrated gearbox|1/256|
|Cables’pulleys reduction|-|
|Joint encoder|Hall effect sensor|


## Lowebody Joints specs

![lower-0](./img/lower-0.png)

### Torso joints

### Joint 0 - torso roll
|   |   |
|---|---|
|![lower-2](./img/lower-2.png) | |
|Motor type|MOOG_C2900576 Moog BLDC motor, OD 49.2, ID 15.5, L 24.7 , W/O HALL SENSOR|
|Fast shaft sensor|Lcore 5 – optical disk 004|
|Slow shaft sensor drive|AMO board  - magnetic target 64/63  (MU7S_64-63N PWB 103839)|
|Harmonic drive|CSD-20-100-2UH_CS (1:100)|
|HW limits|+25/-25 (degrees)|
|SW limits|-|

### Joint 1 - torso pitch
|   |   |
|---|---|
|![lower-1](./img/lower-1.png) | |
|Motor type|MOOG_C2900576 Moog BLDC motor, OD 49.2, ID 15.5, L 24.7 , W/O HALL SENSOR|
|Fast shaft sensor|Lcore 5 – optical disk 004|
|Slow shaft sensor drive|AMO board  - magnetic target 64/63  (MU7S_64-63N PWB 103839)|
|Harmonic drive|CSD-20-100-2UH_CS (1:100)|
|HW limits|+65/-25 front/rear (degrees)|
|SW limits|-|

### Joint 2 - torso yaw
|   |   |
|---|---|
|![upper-1](./img/upper-1.png) | |
|Motor type|Brushless C2900576 8 poles|
|Motor Encoder|Lcore optical encoder on motor shaft|
|Harmonic drive|1/100|
|Joint encoder|Magnetic target 64/63 & AMO board (MU7S_64-63N PWB 103839)|
|HW limits|-45/+45 (degrees)|

### Legs joints

### Joint 0 - left, right hip pitch
|   |   |
|---|---|
|![lower-3](./img/lower-3.png) |![lower-4](./img/lower-4.png) |
|Motor type|MOOG_C2900580 Moog BLDC motor, OD 72.4, ID 15.5, L 27.5 , W/O HALL SENSOR|
|Fast shaft sensor|Lcore 5 – optical disk 004|
|Slow shaft sensor drive|AMO board  - magnetic target 64/63  (MU7S_64-63N PWB 103839)|
|Harmonic drive|CSD-20-100-2UH_CS (1:100)|
|HW limits|+94/-47 front/rear (degrees)|
|SW limits|-|

### Joint 1 - left, right hip roll
|   |   |
|---|---|
|![lower-5](./img/lower-5.png) |![lower-6](./img/lower-6.png) |
|Motor type|MOOG_C2900576 Moog BLDC motor, OD 49.2, ID 15.5, L 24.7 , W/O HALL SENSOR|
|Fast shaft sensor|Lcore 5 – optical disk 004|
|Slow shaft sensor drive|AMO board  - magnetic target 64/63  (MU7S_64-63N PWB 103839)|
|Harmonic drive|CSD-20-100-2UH_CS (1:100)|
|HW limits|+120/-20 front/rear (degrees)|
|SW limits|-|

### Joint 2 - left, right yaw
|   |   |
|---|---|
|![lower-7](./img/lower-7.png) |![lower-8](./img/lower-8.png) |
|Motor type|MOOG_C2900576 Moog BLDC motor, OD 49.2, ID 15.5, L 24.7 , W/O HALL SENSOR|
|Fast shaft sensor|Lcore 5 – optical disk 004|
|Slow shaft sensor drive|AMO board  - magnetic target 64/63  (MU7S_64-63N PWB 103839)|
|Harmonic drive|CSD-20-100-2UH_CS (1:100)|
|HW limits|-80.5/+80.5 (degrees)|
|SW limits|-|

### Joint 3 - left, right knee
|   |   |
|---|---|
|![lower-9](./img/lower-9.png) |![lower-10](./img/lower-10.png) |
|Motor type|MOOG_C2900580 Moog BLDC motor, OD 72.4, ID 15.5, L 27.5 , W/O HALL SENSOR|
|Fast shaft sensor|Lcore 5 – optical disk 004|
|Slow shaft sensor drive|AMO board  - magnetic target 64/63  (MU7S_64-63N PWB 103839)|
|Harmonic drive|CSD-25-100-2UH_CS (1:100)|
|HW limits|+105/-5 (degrees)|
|SW limits|-|

### Joint 4 - left, right foot pitch
|   |   |
|---|---|
|![lower-11](./img/lower-11.png) |![lower-12](./img/lower-12.png) |
|Motor type|MOOG_C2900580 Moog BLDC motor, OD 72.4, ID 15.5, L 27.5 , W/O HALL SENSOR|
|Fast shaft sensor|Lcore 5 – optical disk 004|
|Slow shaft sensor drive|AMO board  - magnetic target 64/63  (MU7S_64-63N PWB 103839)|
|Harmonic drive|CSD-25-100-2UH_CS (1:100)|
|HW limits|+45/-45 (degrees)|
|SW limits|-|

### Joint 5 - left, right foot roll
|   |   |
|---|---|
|![lower-13](./img/lower-13.png) |![lower-14](./img/lower-14.png) |
|Motor type|MOOG_C2900576 Moog BLDC motor, OD 49.2, ID 15.5, L 24.7 , W/O HALL SENSOR|
|Fast shaft sensor|Lcore 5 – optical disk 004|
|Slow shaft sensor drive|AMO board  - magnetic Encoder  (MU7S_25-32N)|
|Harmonic drive|CSD-17-100-2A (1:100)|
|HW limits|+25/-25 (degrees)|
|SW limits|-|

