# Hand Mk5 joints Specs

| Joint number  | Motors | Identifier    | Type | Parent link                 | Child link                  | Notes           |
|---------------|--------|---------------|------|-----------------------------|-----------------------------|-----------------|
|               |        | l_elbow_pitch |  ROT | sim_ecub_l_upperarm         | sim_ecub_l_forearm          | E1 in figure    |
|               |        | l_wrist_yaw   |  ROT | sim_ecub_l_forearm          | sim_ecub_l_wrist_1          | W1 in fig.      |
|               |        | l_wrist_roll  |  ROT | sim_ecub_l_wrist_1          | sim_ecub_l_wrist_2          | W2 in fig.      |
|               |        | l_wrist_pitch |  ROT | sim_ecub_l_wrist_2          | sim_ecub_l_hand_palm        | W3 in fig.      |
|               |        | l_thumb_add   |  ROT | sim_ecub_l_hand_palm        | sim_ecub_l_hand_thumb_1     | T1 in fig.      |
|               |        | l_thumb_prox  |  ROT | sim_ecub_l_hand_thumb_1     | sim_ecub_l_hand_thumb_2     | T2 in fig.      |
|               |        | l_thumb_dist  |  ROT | sim_ecub_l_hand_thumb_2     | sim_ecub_l_hand_thumb_3     | T3 in fig.      |
|               |        | l_index_add   |  ROT | sim_ecub_l_hand_palm        | sim_ecub_l_hand_index_1     | I1 in fig.      |
|               |        | l_index_prox  |  ROT | sim_ecub_l_hand_index_1     | sim_ecub_l_hand_index_2     | I2 in fig.      |
|               |        | l_index_dist  |  ROT | sim_ecub_l_hand_index_2     | sim_ecub_l_hand_index_3     | I3 in fig.      |
|               |        | l_middle_prox |  ROT | sim_ecub_l_hand_palm        | sim_ecub_l_hand_middle_1    | M1 in fig.      |
|               |        | l_middle_dist |  ROT | sim_ecub_l_hand_middle_1    | sim_ecub_l_hand_middle_2    | M2 in fig.      |
|               |        | l_ring_prox   |  ROT | sim_ecub_l_hand_palm        | sim_ecub_l_hand_ring_1      | R1 in fig.      |
|               |        | l_ring_dist   |  ROT | sim_ecub_l_hand_ring_1      | sim_ecub_l_hand_ring_2      | R2 in fig.      |
|               |        | l_pinkie_prox |  ROT | sim_ecub_l_hand_palm        | sim_ecub_l_hand_pinkie_1    | P1 in fig.      |
|               |        | l_pinkie_dist |  ROT | sim_ecub_l_hand_pinkie_1    | sim_ecub_l_hand_pinkie_2    | P2 in fig.      |


<p align="center">
  <img  src=    "../img/pitches.png"
        title=  "pitches.png"
        width=  "750">
</p>
<p align="center">
  <sub>Forearm Mk2 joints 1/2</sub>
</p>

<p align="center">
  <img  src=    "../img/wrist-yaw-roll.png"
        title=  "wrist-yaw-roll.png"
        width=  "750">
</p>
<p align="center">
  <sub>Forearm Mk2 joints 2/2</sub>
</p>

<p align="center">
  <img  src=    "../img/hand-joints.png"
        title=  "hand-joints.png"
        width=  "750">
</p>
<p align="center">
  <sub>Hand Mk5 joints</sub>
</p>