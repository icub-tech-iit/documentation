# Study on change of frame on accelerometer measurements

#### Author

| | |
|:---:|:---|
| [<img src="https://github.com/traversaro.png" width="40">](https://github.com/traversaro) | [@traversaro](https://github.com/traversaro) |

Unless noted, notation follows what is described in ["A Multibody Dynamics Notation – Revision_2"](https://pure.tue.nl/ws/portalfiles/portal/139293126/A_Multibody_Dynamics_Notation_Revision_2_.pdf) 📚

## Problem description
Assume that we have two accelerometers, that are attached to the same rigid body, but placed in two different frames ($S$ and $B$). 
We indicate with:

- $A$ the (absolute) inertial frame that we assume to be rigidly attached to the ground (disregarding the rotation of the earth on itself and any other cosmic rotational motion).
- ${}^A o_B \in \mathbb{R}^3$ the 3D vector that represent the position of the origin of frame $B$ w.r.t. to frame $A$, such that if $S$ is another frame we have:

$$
\begin{equation}
{}^A o_S = {}^A o_B + {}^A R_B {}^B o_S. \; (1)
\end{equation}
$$

- ${}^A g \in \mathbb{R}^3$ the gravity vector expressed in the inertial frame. 
- The angular velocity ${}^B \omega_{A,B} \in \mathbb{R}^3$ is defined as:

$$
\begin{equation}
{}^B \omega_{A,B} \times = {}^B R_A {}^A \dot{R}_B
\end{equation}
$$

from which we can derive that:

$$
\begin{equation}
{}^A \dot{R}_B = {}^A R_B {}^B \omega_{A,B} \times
\end{equation}
$$

and 

$$
\begin{align}
{}^A \ddot{R}_ B &= {}^A \dot{R}_ B {}^B \omega_{A,B} \times + {}^A R_B {}^B \dot{\omega}_{A,B} \times = \\
&= {}^A R_B {}^B \omega_{A,B} \times {}^B \omega_{A,B} \times + {}^A R_B {}^B \dot{\omega}_{A,B} \times.  \; (2)
\end{align}
$$

As $B$ and $S$ are rigidly attached to the same rigid body, we have that ${}^B o_S$ is constant and so:

$$
\begin{equation}
{}^B \dot{o}_S = 0. \; (3)
\end{equation}
$$

The measure of each sensor is given by:

$$
\begin{equation}
m_S = {}^S R_A ( {}^A \ddot{o}_S - {}^A g) \; (4)
\end{equation}
$$

$$
\begin{equation}
m_B = {}^B R_A ( {}^A \ddot{o}_B - {}^A g) \; (5)
\end{equation}
$$

To express $m_S$ in function of $m_B$, we can first take $(1)$ and take first a derivative:

$$
\begin{equation}
{}^A \dot{o}_S = {}^A \dot{o}_B + {}^A \dot{R}_B {}^B o_S + {}^A R_B {}^B \dot{o}_S
\end{equation}
$$

and then we derivative again:

$$
\begin{equation}
{}^A \ddot{o}_S = {}^A \ddot{o}_B + {}^A \ddot{R}_B {}^B o_S + 2 {}^A \dot{R}_B {}^B \dot{o}_S  + {}^A R_B {}^B \ddot{o}_S \; (6)
\end{equation}
$$

as we know that the $B$ and $C$ are rigidly attached to the same body (see $(3)$), we have:

$$
\begin{equation}
{}^A \ddot{o}_S = {}^A \ddot{o}_B + {}^A \ddot{R}_B {}^B o_S. \; (7)
\end{equation}
$$

By substituting $(7)$ in $(4)$ we have:

$$
\begin{align}
m_S &= {}^S R_A ( {}^A \ddot{o}_B + {}^A \ddot{R}_B {}^B o_S  - {}^A g) = \\
&= {}^S R_A ( {}^A \ddot{o}_B - {}^A g)  + {}^S R_A ({}^A \ddot{R}_B {}^B o_S  ) = \\
&= {}^S R_B m_B + {}^S R_A ({}^A \ddot{R}_B {}^B o_S  )
\end{align}
$$

By using $(2)$, we have then:

$$
\begin{equation}
m_S = {}^S R_ B ( m_ B + {}^B \omega_{A,B} \times {}^B \omega_{A,B} \times {}^B o_S  + {}^B \dot{\omega}_{A,B} \times  {}^B o_S )
\end{equation}.
$$
