# Wrist Mk2: the Mathematics of the spherical joint

<p align="center">
  <img  src=    "../img/wrist_mk2.png"
        title=  "wrist_mk2.png"
        width=  "750">
</p>
<p align="center">
  <sub>Wrist Mk2</sub>
</p>

It seems impossible to find the **analytic solution** in the closed form of the *direct geometric problem* (i.e. given the motor angles, find the orientation of the platform), but it is quite easy to calculate the analytic form of the inverse Jacobian if we express the problem in a smart way. The **numeric solution** of the *direct geometric problem* is quite easy as well.

## Premise
- The platform rotates without translation around the origin $O$.
- The length of the arms, equal to the platform radius, is normalized as 1.
- Let's call $q_i$ the positions of the joints on the platform and $p_i$ the positions of the joints in the arms.
- The "L" shape of the connecting rods forces each vector $q_i$ to be always orthogonal to its respective vector $p_i$ in all configurations.
- The euclidean distance $L$ between the $q_i$ and the respective $p_i$ is imposed to be constant by the connecting rod.
- In the case of symmetrical structure, the coordinates of the platform joints in the rest configuration are $q_1=(1,0,0)$, $q_2=(-\frac{1}{2},\frac{\sqrt{3}}{2},0)$ and $q_3=(-\frac{1}{2},-\frac{\sqrt{3}}{2},0)$
- The coordinates of the arm joints, that rotate around the vertical axis, are $p_1=(\cos{\theta_1},\sin{\theta_1},-h)$, $p_2=(\cos{\theta_2},\sin{\theta_2},-h)$ and $p_3=(\cos{\theta_3},\sin{\theta_3},-h)$ with $h$ constant and with $\theta_i$ = rotations of the three motors. In the case of symmetrical structure, at rest we have $\theta_1=60^\circ$, $\theta_2=180^\circ$ and $\theta_3=240^\circ$.
- The above numbers are referred to the **left** employment of the wrist mechanism. In order to use it in the **right** configuration, an offset of $180^\circ$ must be added so that the whole mechanism kinematics will result symmetrically reflected, maintaining the meaning of *roll, pitch, and yaw* under the chosen convention. Thus, at rest, the arm angles will be $\theta_1=240^\circ$, $\theta_2=0^\circ$ and $\theta_3=60^\circ$. This implies that the rest position must be set by properly calibrating the arm position sensors on the software side, while the hand interface must be rotated by $180^\circ$ with respect to the platform on the hardware side.

## Analytic inverse Jacobian
The distance between the platform joints and the arm joints remains constant during the motion:

$$
L^2=(p_i-q_i)\cdot(p_i-q_i)
$$

and thus

$$
\frac{\partial L^2}{\partial t}=2(p_i-q_i)\cdot(\dot{p_i}-\dot{q_i})=0.
$$

From the above equation we have

$$
(p_i-q_i)\cdot\dot{p_i}=(p_i-q_i)\cdot\dot{q_i},
$$

but $\dot{q_i}=\omega\times q_i$ where $\omega$ = angular velocity vector of the platform. By substituting this relation in the previous equation we obtain:

$$
(p_i-q_i)\cdot\dot{p_i}=(p_i-q_i)\cdot(\omega\times q_i)=p_i\cdot(\omega\times q_i)-q_i\cdot(\omega\times q_i)=p_i\cdot(\omega\times q_i)
$$

because the second term $q_i\cdot(\omega\times q_i)$ is null due to the scalar triple product of coplanar vectors.

$p_i$ rotates around the vertical axis, thus its angular velocity is $\dot{p_i}=(e_z\dot{\theta_i})\times p_i$. Let's substitute this relation into the equation above, obtaining:

$$
(p_i-q_i)\cdot(e_z\times p_i)\dot{\theta_i}=(\omega\times q_i)\cdot p_i,
$$

but $p_i\cdot(e_z\times p_i)=0$ thanks to the scalar triple product of coplanar vectors, so it remains:

$$
-q_i\cdot(e_z\times p_i)\dot{\theta_i}=(\omega\times q_i)\cdot p_i
$$

from which we can obtain

$$
\dot{\theta_i} = -\frac{(\omega\times q_i)\cdot p_i}{(e_z\times p_i)\cdot q_i}.
$$

By applying the cyclical permutation of the scalar triple product and the anticommutativity of the cross product we obtain at last:

$$
\dot{\theta_i} = \frac{(q_i\times p_i)\cdot \omega}{(q_i\times p_i)\cdot e_z}.
$$

We can see that this is just the inverse Jacobian by rewriting the three equations in matrix form:

$$
\begin{pmatrix} \dot{\theta_1} \\\ \dot{\theta_2} \\\ \dot{\theta_3} \end{pmatrix}= \begin{pmatrix} \frac{(q_1\times p_1)^T}{(q_1\times p_1)\cdot e_z} \\\ \frac{(q_2\times p_2)^T}{(q_2\times p_2)\cdot e_z} \\\ \frac{(q_3\times p_3)^T}{(q_3\times p_3)\cdot e_z} \end{pmatrix}\omega.
$$

Singularity occurs when one of the three divisors $(q_i\times p_i)\cdot e_z$ is null, i.e., when the joint $q_i$ lies in the same vertical plane that contains the origin and the joint $p_i$.

From the inverse Jacobian, we can obtain the transposed direct Jacobian by numeric inversion, required to project the torque acting on the end effector backward to the motors. Given an algebraic three-vector of angular velocities Roll, Pitch and Yaw, the geometric angular velocity vector $\omega$ is obtained by the known Jacobian transformation from algebraic to geometric representation:

$$
\omega=J_{GEO} \begin{pmatrix} \dot{\phi_r} \\\ \dot{\phi_p} \\\ \dot{\phi_3} \end{pmatrix}.
$$

## Direct geometric problem (numeric solution)
In order to solve the direct geometric problem with an iterative numeric algorithm we build a dynamic system by substituting to the connecting rods with virtual springs with equal length at rest $L$ sempre attached to the arm joints at points $p_i$ and to the platform joints at points $q_i$. The force exerted by each virtual spring is:

$$
F_i=\frac{(p_i-q_i)}{\lvert p_i-q_i\rvert}\left(\lvert p_i-q_i\rvert-L\right).
$$

For simplicity, and in order to obtain more rapid and precise convergence, we use a nonlinear (quadratic) spring law:

$$
F_i=(p_i-q_i)\left(\lvert p_i-q_i\rvert^2-L^2\right).
$$

The total torque applied to the platform is:

$$
\tau=q_1\times F_1 +q_2\times F_2 +q_3\times F_3.
$$

We also assume that the momentum of inertia of the platform is negligible with respect to the viscous friction, so that we have a first order law of motion $\omega=k\tau$. In this way, given the position of the arms, by iterating until convergence we arrive in the correspondant platform orientation by small finite rotations starting from a tentative initial configuration.

- At runtime, we use as initial configuration the orientation obtained in the previous control cycle, so that we are sure to be starting from a configuration close to the real one.
- If no variations occured in the encoder readings, there is no need for any calculation. 
- For better numeric stability it is better to represent internally the platform orientation with a quaternion, normalizing it periodically.

The algorithm can always find a solution if the gap between two arms is less that 180 deg. This is taken into account by the inverse geometrical problem solver, so that it never produces motor angle targets that lead to such singularities.

## Algorithm backtraking
The direct geometric problem solver uses variable gradient descent step and backtraking in order to improve performance by reducing the steps required to converge, as well as to improve rubusteness.
It works in this way:

- the gradient descent step $S$ is initialised to $S_{max}$, and the YPR configuration is initialised with that calculated in the previous control cycle, that should be close to the new solution
- if the algorithm can't converge (singularity) then it performs backtraking to the last good YPR configuration, and divides the step by 2, and continues
- if the step runs below $S_{min}$ then we have reinitialization to (0,0,0) know position, and the step is reinitialized to $S_{max}$.

