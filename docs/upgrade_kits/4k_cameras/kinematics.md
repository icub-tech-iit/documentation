# 4K cameras

## Kinematics

Due to mechanical design constraints, the kinematics of the upgraded head underwent slight changes. While the DH table is the same as the v2 (see: [Head V2 Kinematics](../../icub_kinematics/icub-forward-kinematics/icub-forward-kinematics-head.md)), the end-effector matrix changes to (1)

$$
\begin{equation}
T_E = 
\begin{bmatrix}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & -5.4mm \\
0 & 0 & 0 & 1 \\
\end{bmatrix}
\end{equation}
$$