# Hand Mk5 Coupling Laws

## Coupling variables

We report below a sketch of the finger's kinematics:

<p align="center">
  <img  src=    "../img/mk5_coupling1.png"
        width=  "800">
  <img  src=    "../img/mk5_coupling2.png"
        width=  "800">
  <img  src=    "../img/mk5_coupling3.png"
        width=  "800">
</p>
<p align="center">
  <sub>Hand Mk5 leverism</sub>
</p>

The following table describes the  finger mechanism's coupling variables of the **hand Mk5**.

| Measure | UoM |         |        |   Fingers |      |         | Description | Notes |
| ------- | --- | ------- | ------ | ------- | ------ | ------- | ------|------ |
|         |     | **THUMB**   | **INDEX**  | **MIDDLE** | **RING** | **PINKY** |  | |
| **L0x**     | mm  | \-5.55  | \-5    | \-5 | \-5 | \-5 | X coordinate of first end of leverism |Those measurements are taken with respect to a coordinate system located in **P0** (joint between the palm and first phalanx) |
| **L0y**     | mm  | 2.85    | 4      | 4 | 4 | 4 | Y coordinate of first end of leverism | Those measurements are taken with respect to a coordinate system located in **P0** (joint between the palm and first phalanx) |
| **L1x**     | mm  | 11.5    | 24     | 24 | 24 | 19 | X coordinate of second end of leverism | Those measurements are taken with respect to a coordinate system located in **P0** (joint between the palm and first phalanx) |
| **L1y**     | mm  | 1.5     | 0.8    | 0.8 | 0.8 | 0.5 | Y coordinate of second end of leverism | Those measurements are taken with respect to a coordinate system located in **P0** (joint between the palm and first phalanx) |
| **P1x**     | mm  | 20      | 30     | 30 | 30 | 25 | X coordinate of the axis of the joint between first and second phalanx | Those measurements are taken with respect to a coordinate system located in **P0** (joint between the palm and first phalanx) |
| **P1y**     | mm  | 1.5     | 1.5    | 1.5 | 1.5 | 1.5 |  Y coordinate of the axis of the joint between first and second phalanx | Those measurements are taken with respect to a coordinate system located in **P0** (joint between the palm and first phalanx) |
|         |     |         |        |  |  |  |  |  |
| **q0off**   | deg | \-20.71 | \-7.54 | \-7.54 | \-7.54 | \-7.54 | Angle of the lever **ACD** respect to the vertical in position 0. | |
| **q2bias**  | deg | 180     | 173.35 | 173.35 | 173.35 | 170.54 | Angle of **L1-P1** respect to the horizontal in position 0. | |
| **q1off**   | deg | 4.29    | 2.86   | 2.86 | 2.86 | 6.03 | Angle of **P1-P0** respect to the horizontal in position 0.  | |
| **q1bias**  | deg | 0       | 0      | 0 | 0 | 0 |  Angle of **B-P0** respect to the horizontal in position 0. Not drawn in the picture because null.  | |
|         |     |         |        |  |  |  |  | |
| **q0**      | deg | 45.32   | 78.03  | 78.03 | 78.03 | 78.03 | Absolute angle of the lever **ACD** respect the palm, which has its fulcrum at **C** and transmits motion to the connecting rod **AB** by reversing the motion of the cable connected at **D**.| |
| **q1**      | deg | 82.06   | 90     | 90 | 90 | 90 | Absolute angle of the first phalanx with respect to the palm. | |
| **q2**      | deg | 68.31   | 189.2  | 189.2 | 189.2 | 183.31 | Absolute angle of the second phalanx with respect to the palm.  | |
| **beta**    | deg | 135.65  | 82.33  | 82.33 | 82.33 | 80.54 | Angle between the line **P1-L0** and the horizontal and represents an intermediate step for the calculation of q2.  | |
|         |     |         |        |  |  |  |  | |
| **k**       | mm  | 17.1    | 29.18  | 29.18 | 29.18 | 24.25 | Connecting rod length **L1-L0** (constant).  | |
| **d**       | mm  | 20.06   | 30.04  | 30.04 | 30.04 | 25.04 | The distance between the two joints **P1-P0** (constant). | |
| **l**       | mm  | 8.5     | 6.04   | 6.04 | 6.04 | 6.08 | The distance between the attachment point **L1** of the connecting rod **L1-L0** on the second knuckle and the second joint **P1** (constant). | |
| **b**       | mm  | 6.24    | 6.4    | 6.4 | 6.4 | 6.4 | The distance between the attachment point **L0** of the connecting rod **L1-L0** on the palm and the first joint **P0** (constant). | |
| **h**       | mm  | \-      | \-     | \- | \- | \- | The distance between the second joint **P1** and the connection **L0** of the connecting rod on the palm (variable, depends on **q1**). |  Not needed for now |
| **s**       | mm  | 6.52    | 5.5    | 5.5 | 5.5 | 5.5 | the distance between joint **B** of the connecting rod A-B and joint **P0** (constant).| |
| **t**       | mm  | 13      | 14.5   | 14.5 | 14.5 | 14.5 | The length of the connecting rod **A-B**. | |
| **f**       | mm  | 6       | 5.5    | 5.5 | 5.5 | 5.5 | The length of the connecting rod **A-C**. | |
| **r**       | mm  | 7.5     | 8.5    | 8.5 | 8.5 | 8.5 | The length of the connecting rod **D-C**.  | |
| **a**       | mm  | \-      | \-     | \- | \- | \- | The distance between the connecting rod joint **A** and the joint **P0** (variable, depends on **q0**). | Not needed for now |

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

$$q_{2} = \tan^{- 1}\left( \frac{P_{1y}(q_{1}) - L_{0y}}{P_{1x}(q_{1}) - L_{0x}} \right) + \cos^{- 1}{\left( \frac{l^{2} - k^{2} + h^{2}(q_{1})}{2lh(q_{1})} \right) - q_{2bias}}.$$

The Jacobian that relates the variations of **$q_{2}$** to the variations of **$q_{1}$** is:

$$\frac{\partial q_{2}}{\partial q_{1}} = \frac{1}{2 - \frac{d^{2} - b^{2}}{d^{2} - L_{0} \bullet P_{1}}} + \frac{\left( L_{0x}P_{1y} - L_{0y}P_{1x} \right)\left( l^{2} - k^{2} - h^{2} \right)}{2lh^{3}\sqrt{1 - \left( \frac{l^{2} - k^{2} + h^{2}}{2lh} \right)^{2}}}.$$

The relationship between **$q_{0}$** and **$q_{1}$** is:

$$q_{1} = \tan^{- 1}\left( \frac{A_{y}(q_{0}) - P_{0y}}{A_{x}(q_{0}) - P_{0x}} \right) + \cos^{- 1}{\left( \frac{s^{2} - t^{2} + a^{2}(q_{0})}{2sa(q_{0})} \right) - q_{1bias}}.$$
