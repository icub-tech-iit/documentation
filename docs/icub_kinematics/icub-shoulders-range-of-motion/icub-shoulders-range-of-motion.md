# Range of Motion of the iCub Shoulders
The range of motion of the shoulders of **iCub 2.x** is constrained by the length of the tendons. Unfortunately, these constraints cannot be written in the form $\left[\theta_{\text{min}}, \; \theta_{\text{max}}\right]$, which are the constraints currently implemented in the firmware.

!!! warning
    Therefore, care must be taken when controlling the arm in the **Joint Space** to avoid reaching configurations that may **break the tendons**.

!!! note
    By contrast, when controlling the arm in the **Cartesian Space** by means of the [Cartesian Controller](https://robotology.github.io/robotology-documentation/doc/html/icub_cartesian_interface.html), the software will always find solutions for the reaching task that **comply with the cable length constraints**. 

## Correct Limits
The length of the tendons imposes the following constraints on the shoulder's joints:

$$
\begin{equation}
\mathbf{A} \cdot \mathbf{q} + \mathbf{b} > 0,
\end{equation}
$$

where $\mathbf{q}$ is the vector of the 3 shoulder's joints expressed in ==radians==, whereas:

$$
\begin{equation}
\mathbf{A} = 
\begin{pmatrix}
     c & -c &  0 \\
    -1 &  1 &  0 \\
    -c &  c &  0 \\
     1 & -1 &  0 \\
     0 & -1 &  0 \\
     0 &  1 &  0 \\
     0 &  1 &  0 \\
     0 & -1 &  0 \\
     c & -c & -c \\
    -1 &  1 &  1 \\
    -c &  c &  c \\
     1 & -1 & -1 \\
     0 &  1 &  1 \\
     0 & -1 & -1
\end{pmatrix}
\quad 
\mathbf{b} = \frac{\pi}{180} \cdot
\begin{pmatrix}
     404   \\
      54.3 \\
      46   \\
     305.7 \\
     215.7 \\
     150   \\
      54.3 \\
     210   \\
     431   \\
     101.7 \\
     109   \\
     258.3 \\
      71.7 \\
     228.3
\end{pmatrix},
\end{equation}
$$

with $c = 1.71$.

Remarkably, this set of constraints can be reduced by solving a linear programming problem whose outcome is:

$$
\begin{equation}
\mathbf{A^*} = 
\begin{pmatrix}
     c & -c &  0 \\
     c & -c & -c \\
     0 &  1 &  1 \\
    -c &  c &  c \\
     0 & -1 & -1
\end{pmatrix}
\quad 
\mathbf{b^*} = \frac{\pi}{180} \cdot
\begin{pmatrix}
     347    \\
     366.57 \\
      66.6  \\
     112.42 \\
     213.3
\end{pmatrix}
\end{equation}
$$

!!! note
    The [Cartesian Controller](https://robotology.github.io/robotology-documentation/doc/html/icub_cartesian_interface.html) software component implements the couple $\left( \mathbf{A^*}, \; \mathbf{b^*}\right)$. 
