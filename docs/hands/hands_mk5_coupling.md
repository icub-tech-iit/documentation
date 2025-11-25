# Hand Mk5 Coupling Laws

## Coupling variables

Below, a sketch of the finger kinematics is reported:

<p align="center">
  <img  src=    "../img/finger-scheme-1_mod.png"
        width=  "">
  <img  src=    "../img/finger-scheme-2_mod.png"
        width=  "600">
</p>
<p align="center">
  <sub>Hand Mk5 leverism</sub>
</p>

Unless specified otherwise, angles reported in the next sections follow the convention in figure.

- $q_0$ is the variable angle of $A-C$.
- $q_1$ is the variable angle of the first phalanx.
- $q_2$ is the variable angle of the second phalanx.

!!! note "Joint angle feedback"

    The joint encoder is mounted in position $P_0$, hence we can measure the angle $q_1$ that in turn is used to close the control loop.

!!! note "Motor encoder feedback"

    A quadrature encoder is mounted on the motor shaft, which is currently used only to handle the tendon wrapping.         

## Coupling Laws

Considering the following quantities:

$$b = \left| L_{0} - P_{0} \right|$$

$$d = \left| P_{1} - P_{0} \right|$$

$$l = \left| L_{1} - P_{1} \right|$$

$$k = \left| L_{1} - L_{0} \right|$$

$$s = \left| B - P_{0} \right|$$

$$t = |A - B|$$

$$f = |A - C|$$

$$r = |D - C|$$

$$h(q_{1}) = \left| P_{1}(q_{1}) - L_{0} \right|$$

$$a(q_{0}) = \left| A(q_{0}) - P_{0} \right|$$

$$P_{1x} = P_{0x} + d\cos\left( q_{1} + q_{1off} \right)$$

$$P_{1y} = P_{0y} + d\sin\left( q_{1} + q_{1off} \right)$$

$$A_{x} = C_{x} + f\cos\left( q_{0} + q_{0off} \right)$$

$$A_{y} = C_{y} + f\sin\left( q_{0} + q_{0off} \right)$$

We have **$q_{2}$**  that depends only on the
variable **$q_{1}$** through the implicit dependence on **$P_{1}$** and **h**:

$$q_{2} = \tan^{- 1}\left( \frac{P_{1y}(q_{1}) - L_{0y}}{P_{1x}(q_{1}) - L_{0x}} \right) + \cos^{- 1}{\left( \frac{l^{2} - k^{2} + h^{2}(q_{1})}{2lh(q_{1})} \right) - q_{2bias} - \pi}.$$

The Jacobian that relates the variations of **$q_{2}$** to the variations of **$q_{1}$** is:

$$\frac{\partial q_{2}}{\partial q_{1}} = \frac{1}{2 - \frac{d^{2} - b^{2}}{d^{2} - (L_{0x}P_{1x}+L_{0y}P_{1y})}} + \frac{\left( L_{0x}P_{1y} - L_{0y}P_{1x} \right)\left( l^{2} - k^{2} - h^{2}(q_1) \right)}{2lh^{3}(q_1)\sqrt{1 - \left( \frac{l^{2} - k^{2} + h^{2}(q_1)}{2lh(q_1)} \right)^{2}}}.$$

The relationship between **$q_{0}$** and **$q_{1}$** is:

$$q_{1} = \tan^{- 1}\left( \frac{A_{y}(q_{0}) - P_{0y}}{A_{x}(q_{0}) - P_{0x}} \right) + \cos^{- 1}{\left( \frac{s^{2} - t^{2} + a^{2}(q_{0})}{2sa(q_{0})} \right) - q_{1bias} - \pi}.$$

Let us move on to explore the relation between the motor pulling the tendon and $q_0$. Both the tendon ends are clamped to bushings that describe circular arcs; one bushing is centered in $D$ and its trajectory is an arc centered in $C$ whereas the other is centered in $F$ and its trajectory is an arc centered in $E$.

<p align="center">
  <img  src=    "../img/finger-motor-pulley.png"
        width=  "400">
</p>

<p align="center">
  <sub>Finger motor pulley (forearm)</sub>
</p>

Be $q_{mot}$ the variable angle of the motor pulley and assuming the steel wire to be inextensible, the arc lengths described by the two trajectories shall be equal, i.e.:

$$r_{mot} \cdot q_{mot} = r \cdot q_0$$

Hence we get

$$q_0 = \frac{r_{mot}}{r} \cdot q_{mot} $$

## Mk5.2 coupling variables

The following table describes the coupling variables of the finger mechanisms in the **hand Mk5.2**.

| Name        | UoM |           |           | Values     |          |           | Description                                                                        |
|-------------|-----|-----------|-----------|------------|----------|-----------|------------------------------------------------------------------------------------|
|             |     | **THUMB** | **INDEX** | **MIDDLE** | **RING** | **PINKY** |                                                                                    |
| $L_{0x}$    | mm  | -5        | -5        | -5         | -5       | -5        | $x$ coordinate of the first end of   the leverism                                  |
| $L_{0y}$    | mm  | 4         | 4         | 4          | 4        | 4         | $y$ coordinate of the the first end   of the leverism                              |
| $L_{1x}$    | mm  | 29.09     | 34.18     | 34.18      | 34.18    | 29.09     | $x$ coordinate of the second end of   the leverism                                 |
| $L_{1y}$    | mm  | 0.24      | -0.2      | -0.2       | -0.2     | 0.24      | $y$ coordinate of the second end of   the leverism                                 |
| $P_{0x}$    | mm  | 0         | 0         | 0          | 0        | 0         | $x$ coordinate of the axis of the joint between ground and the first phalanx (origin)  |
| $P_{0y}$    | mm  | 0         | 0         | 0          | 0        | 0         | $y$ coordinate of the axis of the joint between ground and the first phalanx (origin)  |
| $P_{1x}(0)$ | mm  | 35        | 40        | 40         | 40       | 35        | $x$ coordinate of the axis of the   joint between the first and the second phalanx |
| $P_{1y}(0)$ | mm  | 1.5       | 1.5       | 1.5        | 1.5      | 1.5       | $y$ coordinate of the axis of the   joint between the first and the second phalanx |
|             |     |           |           |            |          |           |                                                                                    |
| $q_{0off}$  | deg | -97.54    | -97.54    | -97.54     | -97.54   | -97.54    | Angle of $A-C$ when the finger is in the theoretical zero position (read note 1)   |
| $q_{2bias}$ | deg | -162.27   | -156.18   | -156.18    | -156.18  | -162.27   | Angle between $L_1-P_1$ and the horizontal of the second phalanx (read note 2)     |
| $q_{1off}$  | deg | 2.45      | 2.15      | 2.15       | 2.15     | 2.45      | Angle of $P_1-P_0$  when the finger is in the theoretical zero position            |
| $q_{1bias}$ | deg | -90       | -90       | -90        | -90      | -90       | Angle of $B-P_0$  when the finger is in the theoretical zero position              |
|             |     |           |           |            |          |           |                                                                                    |
| $q_{0max}$  | deg | -6.42     | -6.42     | -6.42      | -6.42    | -6.42     | Max value of $q_0$, i.e. when the   finger is fully closed                         |
| $q_{1max}$  | deg | 98        | 98        | 98         | 98       | 98        | Max value of $q_1$, same as above                                                  |
| $q_{2max}$  | deg | 199.77    | 196.35    | 196.35     | 196.35   | 199.77    | Max value of $q_2$, same as above                                                  |
|             |     |           |           |            |          |           |                                                                                    |
| $q_{1rest}$ | deg | 3.63      | 5.75      | 5.75       | 5.75     | 3.63      | Rest value for $q_1$                                                               |
| $q_{2rest}$ | deg | 3.63      | 5.75      | 5.75       | 5.75     | 3.63      | Rest value for $q_2$                                                               |
|             |     |           |           |            |          |           |                                                                                    |
| $k$         | mm  | 34.30     | 39.4      | 39.4       | 39.4     | 34.30     | Connecting rod length, $\|L_1-L_0\|$                                               |
| $d$         | mm  | 35.03     | 40.03     | 40.03      | 40.03    | 35.03     | Distance between the two   joints,   $P_1$ and $P_0$                               |
| $l$         | mm  | 6.04      | 6.07      | 6.07       | 6.07     | 6.04      | Distance between $L_1$ and   $P_1$                                                 |
| $b$         | mm  | 6.4       | 6.4       | 6.4        | 6.4      | 6.4       | Distance between $L_0$ and   $P_0$                                                 |
| $s$         | mm  | 5.5       | 5.5       | 5.5        | 5.5      | 5.5       | Distance between joint $B$ of   the   connecting rod $A-B$ and joint   $P_0$       |
| $t$         | mm  | 14.5      | 14.5      | 14.5       | 14.5     | 14.5      | Length of the connecting rod   $A-B$                                               |
| $f$         | mm  | 5.5       | 5.5       | 5.5        | 5.5      | 5.5       | Length of the connecting rod   $A-C$                                               |
| $r$         | mm  | 8.5       | 8.5       | 8.5        | 8.5      | 8.5       | Length of the connecting rod   $D-C$                                               |
| $r_{mot}$   | mm  | 5         | 5         | 5          | 5        | 5         | Distance between the axis of the bushing and the rotational axis of the finger motor |

> **Note 1:** Version Mk5.2 has shifted the hard stop of the rest position to the last moving phalanx. As a consequence, $q_1$ is non-zero when the hand is at rest. Parameters were measured considering the following, phisically compenetrating position to stay consistent with the reference system adopted until now. The new rest positions for all the fingers have been stored inside $q_{1rest}$, $q_{2rest}$ (see table).

> **Note 2:** As a consequence of Note 1, $q_{2bias}$ is now better generalised as the angle between $L_1-P_1$ and the horizontal of the second phalanx. This new definition still works with older versions. See image to have a more intuitive notion.

<p align="center">
  <img  src=    "../img/mk5_2-zero.png"
        width=  "600">
</p>

<p align="center">
  <sub>Theoretical, unreachable zero for Mk5.2</sub>
</p>

<p align="center">
  <img  src=    "../img/mk5_2-true-rest.png"
        width=  "600">
</p>

<p align="center">
  <sub>Actual rest position for Mk5.2</sub>
</p>

<p align="center">
  <img  src=    "../img/mk5_2-q2bias.png"
        width=  "500">
</p>

<p align="center">
  <sub>Generalised definition for q2bias</sub>
</p>

## Mk5.1 coupling variables

The following table describes the coupling variables of the finger mechanisms in the **hand Mk5.1**.

| Name        | UoM |           |           | Values     |          |           | Description                                                                        |
|-------------|-----|-----------|-----------|------------|----------|-----------|------------------------------------------------------------------------------------|
|             |     | **THUMB** | **INDEX** | **MIDDLE** | **RING** | **PINKY** |                                                                                    |
| $L_{0x}$    | mm  | -5        | -5        | -5         | -5       | -5        | $x$ coordinate of the first end of   the leverism                                  |
| $L_{0y}$    | mm  | 4         | 4         | 4          | 4        | 4         | $y$ coordinate of the the first end   of the leverism                              |
| $L_{1x}$    | mm  | 29        | 34        | 34         | 34       | 29        | $x$ coordinate of the second end of   the leverism                                 |
| $L_{1y}$    | mm  | 0.8       | 0.8       | 0.8        | 0.8      | 0.5       | $y$ coordinate of the second end of   the leverism                                 |
| $P_{1x}(0)$ | mm  | 35        | 40        | 40         | 40       | 35        | $x$ coordinate of the axis of the   joint between the first and the second phalanx |
| $P_{1y}(0)$ | mm  | 1.5       | 1.5       | 1.5        | 1.5      | 1.5       | $y$ coordinate of the axis of the   joint between the first and the second phalanx |
|             |     |           |           |            |          |           |                                                                                    |
| $q_{0off}$  | deg | -97.54    | -97.54    | -97.54     | -97.54   | -97.52    | Angle of $A-C$ when the finger is   fully open                                     |
| $q_{2bias}$ | deg | -173.35   | -173.35   | -173.35    | -173.35  | -170.53   | Angle of $L_1-P_1$ when the finger   is fully open                                 |
| $q_{1off}$  | deg | 2.45      | 2.15      | 2.15       | 2.15     | 2.46      | Angle of $P_1-P_0$  when the finger is fully open                                  |
| $q_{1bias}$ | deg | -90       | -90       | -90        | -90      | -90       | Angle of $B-P_0$  when the finger is fully open                                    |
|             |     |           |           |            |          |           |                                                                                    |
| $q_{0max}$  | deg | -12       | -12       | -12        | -12      | -11.97    | Max value of $q_0$, i.e. when the   finger is fully closed                         |
| $q_{1max}$  | deg | 90        | 90        | 90         | 90       | 90        | Max value of $q_1$, same as above                                                  |
| $q_{2max}$  | deg | 191.44    | 193.06    | 193.06     | 193.06   | 188.7     | Max value of $q_2$, same as above                                                  |
|             |     |           |           |            |          |           |                                                                                    |
| $k$         | mm  | 34.15     | 39.13     | 39.13      | 39.13    | 34.18     | Connecting rod length, $\|L_1-L_0\|$                                               |
| $d$         | mm  | 35.03     | 40.03     | 40.03      | 40.03    | 35.03     | Distance between the two   joints,   $P_1$ and $P_0$                               |
| $l$         | mm  | 6.04      | 6.04      | 6.04       | 6.04     | 6.08      | Distance between $L_1$ and   $P_1$                                                 |
| $b$         | mm  | 6.4       | 6.4       | 6.4        | 6.4      | 6.4       | Distance between $L_0$ and   $P_0$                                                 |
| $s$         | mm  | 5.5       | 5.5       | 5.5        | 5.5      | 5.5       | Distance between joint $B$ of   the   connecting rod $A-B$ and joint   $P_0$       |
| $t$         | mm  | 14.5      | 14.5      | 14.5       | 14.5     | 14.5      | Length of the connecting rod   $A-B$                                               |
| $f$         | mm  | 5.5       | 5.5       | 5.5        | 5.5      | 5.5       | Length of the connecting rod   $A-C$                                               |
| $r$         | mm  | 8.5       | 8.5       | 8.5        | 8.5      | 8.5       | Length of the connecting rod   $D-C$                                               |
| $r_{mot}$   | mm  | 5         | 5         | 5          | 5        | 5         | Distance between the axis of the bushing and the rotational axis of the finger motor |


## Mk5.0 coupling variables

The following table describes the coupling variables of the finger mechanisms in the **hand Mk5.0**.

| Name        | UoM |           |           | Values     |          |           | Description                                                                        |
|-------------|-----|-----------|-----------|------------|----------|-----------|------------------------------------------------------------------------------------|
|             |     | **THUMB** | **INDEX** | **MIDDLE** | **RING** | **PINKY** |                                                                                    |
| $L_{0x}$    | mm  | -5.55     | -5        | -5         | -5       | -5        | $x$ coordinate of the first end of   the leverism                                  |
| $L_{0y}$    | mm  | 2.85      | 4         | 4          | 4        | 4         | $y$ coordinate of the the first end   of the leverism                              |
| $L_{1x}$    | mm  | 11.5      | 24        | 24         | 24       | 19        | $x$ coordinate of the second end of   the leverism                                 |
| $L_{1y}$    | mm  | 1.5       | 0.8       | 0.8        | 0.8      | 0.5       | $y$ coordinate of the second end of   the leverism                                 |
| $P_{1x}(0)$ | mm  | 20        | 30        | 30         | 30       | 25        | $x$ coordinate of the axis of the   joint between the first and the second phalanx |
| $P_{1y}(0)$ | mm  | 1.5       | 1.5       | 1.5        | 1.5      | 1.5       | $y$ coordinate of the axis of the   joint between the first and the second phalanx |
|             |     |           |           |            |          |           |                                                                                    |
| $q_{0off}$  | deg | -110.71   | -97.54    | -97.54     | -97.54   | -97.54    | Angle of $A-C$ when the finger is   fully open                                     |
| $q_{2bias}$ | deg | -180      | -173.35   | -173.35    | -173.35  | -170.54   | Angle of $L_1-P_1$ when the finger   is fully open                                 |
| $q_{1off}$  | deg | 4.29      | 2.86      | 2.86       | 2.86     | 3.43      | Angle of $P_1-P_0$  when the finger is fully open                                  |
| $q_{1bias}$ | deg | -90       | -90       | -90        | -90      | -90       | Angle of $B-P_0$  when the finger is fully open                                    |
|             |     |           |           |            |          |           |                                                                                    |
| $q_{0max}$  | deg | -44.68    | -11.97    | -11.97     | -11.97   | -11.97    | Max value of $q_0$, i.e. when the   finger is fully closed                         |
| $q_{1max}$  | deg | 86.35     | 90        | 90         | 90       | 90        | Max value of $q_1$, same as above                                                  |
| $q_{2max}$  | deg | 135.65    | 189.2     | 189.2      | 189.2    | 183.31    | Max value of $q_2$, same as above                                                  |
|             |     |           |           |            |          |           |                                                                                    |
| $k$         | mm  | 17.1      | 29.18     | 29.18      | 29.18    | 24.25     | Connecting rod length, $\|L_1-L_0\|$                                               |
| $d$         | mm  | 20.06     | 30.04     | 30.04      | 30.04    | 25.04     | Distance between the two joints,   $P_1$ and $P_0$                                 |
| $l$         | mm  | 8.5       | 6.04      | 6.04       | 6.04     | 6.08      | Distance between $L_1$ and $P_1$                                                   |
| $b$         | mm  | 6.24      | 6.4       | 6.4        | 6.4      | 6.4       | Distance between $L_0$ and $P_0$                                                   |
| $s$         | mm  | 6.52      | 5.5       | 5.5        | 5.5      | 5.5       | Distance between joint $B$ of the   connecting rod $A-B$ and joint $P_0$           |
| $t$         | mm  | 13        | 14.5      | 14.5       | 14.5     | 14.5      | Length of the connecting rod $A-B$                                                 |
| $f$         | mm  | 6         | 5.5       | 5.5        | 5.5      | 5.5       | Length of the connecting rod $A-C$                                                 |
| $r$         | mm  | 7.5       | 8.5       | 8.5        | 8.5      | 8.5       | Length of the connecting rod $D-C$                                                 |
