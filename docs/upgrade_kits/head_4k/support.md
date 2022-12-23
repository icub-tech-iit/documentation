# KIT_009 iCub new head

## Upgrade Kit




|       |       	          |
|   :--- |    :-----------           |
|    IIT alias (used as ordering reference)| KIT_009 |
|    Applicable to|iCub |
|Available onboard ||


|  #  |     Cod    |   Alias  |  Rev | UM |  Qta  |  Description |
|   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |
| 1 |    | MKIT_009 |   | Pieces  |  1  |  |
|  2  |	     |		WKIT_009	 |	 	| Pieces	| 1	|  |
|  3  |	     |		EKIT_009	 |	 	| Pieces	| 1	|  |

## Content material  MKIT_009


|  Pieces |     Alias    |  Description       |  Cod. Wgst |
|   :---: |    :-----------:      |     :---: |   :---:   |
|        |       |             |           |
|        |       |             |           |
|        |       |             |           |
|        |       |             |           |
|        |       |             |           |
|        |       |             |           |

## Content material  WKIT_009

|  Pieces |     Alias    |    REV    |  Description       |  Cod. Wgst |
|   :---: |    :-----------:      |     :---: |   :---:   |   :---:   |
|        |       |      |             |           |
|        |       |      |             |           |



## Content material  EKIT_009 
|  Pieces |     Alias    |    REV    |  Description       |  Cod. Wgst |
|   :---: |    :-----------:      |     :---: |   :---:   |   :---:   |
|        |       |      |             |           |
|        |       |      |             |           |





## Assembly instruction.

**Assembly sequence** :<br>

## Kinematics

Due to mechanical design constraints, the kinematics of the upgraded head underwent slight changes. While the DH table is the same as the v2 (see: [Head V2 Kinematics](../../icub_kinematics/icub-forward-kinematics/icub-forward-kinematics-head.md)), the end-effector matrix changes to:

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
