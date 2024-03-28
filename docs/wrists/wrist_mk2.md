# Wrist Mk2.0 vs Wrist Mk2.1
<p align="center">
  <img  src=    "../img/mk2.0_vs_mk2.1.png"
        title=  "mk2.0_vs_mk2.1.png"
        width=  "">
</p>
<p align="center">
  <sub>Wrist Mk2.0 (left) vs Wrist Mk2.1 (right)</sub>
</p>

# Wrist Mk2 and Elbow joints Specs

| Joint number | Motors | Identifier    | Type | Parent link | Child link  | Mk2.0 lower limit | Mk2.0 upper limit | Mk2.1 low. l. | Mk2.1 upp. l. | Notes        |
|--------------|--------|---------------|------|-------------|-------------|-------------------|-------------------|---------------|---------------|--------------|
|              |        | l_elbow       | ROT  | l_upperarm  | l_forearm   | -                 | -                 | -             | -             | E1 in fig.   |
|              |        | l_wrist_yaw   | ROT  | l_forearm   | l_wrist_1   | -92°              | 92°               | -92°          | 92°           | W1 in fig.   |
|              |        | l_wrist_roll  | ROT  | l_wrist_1   | l_wrist_2   | -62°              | 52°               | -33°          | 40°           | W2 in fig.   |
|              |        | l_wrist_pitch | ROT  | l_wrist_2   | l_hand_palm | -32°              | 32°               | -20°          | 20°           | W3 in fig.   |
|              |                        |      |             |             |                   |                   |               |               |              |
|              |        | r_elbow       | ROT  | r_upperarm  | r_forearm   | -                 | -                 | -             | -             |              |
|              |        | r_wrist_yaw   | ROT  | r_forearm   | r_wrist_1   | -                 | -                 | -92°          | 92°           |              |
|              |        | r_wrist_roll  | ROT  | r_wrist_1   | r_wrist_2   | -                 | -                 | -33°          | 40°           |              |
|              |        | r_wrist_pitch | ROT  | r_wrist_2   | r_hand_palm | -                 | -                 | -20°          | 20°           |              |

<p align="center">
  <img  src=    "../img/pitches.png"
        title=  "pitches.png"
        width=  "750">
</p>
<p align="center">
  <sub>Wrist Mk2 and Elbow joints 1/2</sub>
</p>

<p align="center">
  <img  src=    "../img/wrist-yaw-roll.png"
        title=  "wrist-yaw-roll.png"
        width=  "750">
</p>
<p align="center">
  <sub>Wrist Mk2 and Elbow joints 2/2</sub>
</p>