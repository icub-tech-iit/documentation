# Automatic Firmware Update

This guide explains how to perform an automatic firmware update for iCub robots using the `manageFWrobot.py` script, which is located in `robotology-superbuild/src/icub-firmware-build/scripts/`.

!!! warning "Prerequisites"

    **Before running the updater, read the Prerequisites section below for required pre-checks, common failure modes, and recovery steps. Following those checks will avoid most problems and make the update process smoother.**

## 1. Automated Firmware Update (AFU) Using Provided Scripts

The recommended way to perform a firmware update is to use the provided bash scripts in the `scripts` directory. These scripts simplify the process by automatically selecting the correct configuration files and options for your robot. 
 

### 1.1 Navigate to the Scripts Directory

Open a terminal and change directory to:

```bash
cd /path/to/robotology-superbuild/src/icub-firmware-build/scripts
```

!!! tip "Recommended script"

    **Use ./FirmwareUpdater.script.update.all.sh to update all boards. It runs in "update" mode (it only programs a board when the firmware actually needs updating) and the scripts perform CAN-board programming in parallel where possible to speed up the process.**

### 1.2 Update a Specific Body Part

- To update a specific body part, run the corresponding script. For example, to update the left arm:

```bash
./FirmwareUpdater.script.update.left_arm.sh
```

- Scripts are available for: `head`, `face`, `left_arm`, `right_arm`, `torso`, `left_leg`, `right_leg`, and for all parts (`all`).

### 1.3 Update All Boards of a Specific Type

- To update all boards of a certain type (e.g., all FOC boards):

```bash
./FirmwareUpdater.script.update.all.foc.sh
```

- Similarly, use `FirmwareUpdater.script.update.all.ems4.sh` for all EMS4 boards, etc.

### 1.4 Customizing or Excluding Board Types

- To exclude a board type or further customize the update, copy one of the scripts (e.g., `FirmwareUpdater.script.update.left_arm.sh`) and edit the command line:
    - Use the `-xb <board_type>` option to exclude a board type (e.g., `-xb ems4`).
    - Change the `-p <part>` or `-b <board_type>` options as needed.
    - Example to update left_leg but exclude EMS4 boards:

```bash
./manageFWrobot.py -n `yarp resource --from network.$YARP_ROBOT_NAME.xml | grep ^\".*$ | sed 's/"//g'` -f ../info/firmware.info.xml -p left_leg -a update -xb ems4
```

- Save your custom script and run it as above.

### 1.5 Using Action-Oriented Scripts (info, query, verify, update, program)

In addition to part- or board-specific scripts, the `scripts` directory also provides action-oriented scripts that let you perform a specific action (such as info, query, verify, update, or program) on all or selected boards/parts.

#### Examples:

- To show board and firmware info for all parts:

```bash
./FirmwareUpdater.script.info.all.sh
```

- To query the current firmware versions on all boards:

```bash
./FirmwareUpdater.script.query.all.sh
```

- To verify that all boards have the required firmware version:

```bash
./FirmwareUpdater.script.verify.all.sh
```

- To update all boards (only if not up-to-date):

```bash
./FirmwareUpdater.script.update.all.sh
```

- To force programming of all boards (regardless of current version):

```bash
./FirmwareUpdater.script.program.all.sh
```

You can also find scripts for specific parts and actions, such as:

```bash
./FirmwareUpdater.script.info.left_arm.sh
./FirmwareUpdater.script.query.right_leg.sh
./FirmwareUpdater.script.verify.head.sh
```

> These scripts are named using the pattern: `FirmwareUpdater.script.<action>.<part or all>.sh`

Use the script that matches the action and part you want to operate on.

!!! warning "Sidenotes"

    - **Always use the provided scripts unless you have a special need. If modifications are necessary, ensure you thoroughly understand the implications and double-check all parameters.**
    - **Do not edit scripts unless you understand the options.**
    - **Check logs in the `../logs/` directory after running a script.**

> For advanced customization, see the [Step-by-Step Procedure](#step-by-step-procedure) below.

---

## 2. Automatic Firmware Update (AFU) by launching the manageFWrobot.py

If you need more control or want to understand the underlying process, you can use the `manageFWrobot.py` script directly.


### Step-by-Step Procedure

### 2.1 Prepare the XML Files

- **Network XML file (`-n`)**: Describes the robot's board configuration (e.g., `network.iCubGenova02.xml`).  
  Location: `robotology-superbuild/src/robots-configuration/`
- **Firmware info XML file (`-f`)**: Lists firmware versions and file paths (e.g., `firmware.info.xml`).  
  Location: `robotology-superbuild/src/icub-firmware-build/info/`

!!! note

    Always verify that the firmware info file contains the correct versions and paths for your update.

### 2.2 Navigate to the Scripts Directory

Open a terminal and change directory to:

```bash
cd /path/to/robotology-superbuild/src/icub-firmware-build/scripts
```

### 2.3 Run the Firmware Updater Script

The general command structure is:

```bash
./manageFWrobot.py -n <network_file.xml> -f <firmware_info.xml> -p <part> -b <board_type> -a <action>
```

!!! example

    ```bash
    ./manageFWrobot.py -n network.iCubGenova02.xml -f ../info/firmware.info.xml -p left_leg -b foc -a update
    ```

#### Example with Parallel Updates

For faster firmware updates when multiple CAN boards of the same type are present on the same Ethernet connection:

```bash
./manageFWrobot.py -n network.iCubGenova02.xml -f ../info/firmware.info.xml -p left_leg -b foc -a update --parallel
```

#### Option Definitions

- `-n` : Path to the network XML file describing the robot's boards.
- `-f` : Path to the firmware info XML file with firmware versions and file locations.
- `-p` : The robot part to operate on (e.g., `face`, `left_arm`, `right_leg`, `all`).
- `-b` : The board type to target (e.g., `foc`, `ems4`, `all`).
- `-a` : The action to perform. Common values:
  - `info` : Show board and firmware info.
  - `query` : Query current firmware versions on the boards.
  - `verify` : Check if boards have the required firmware version.
  - `update` : Update firmware only if the board is not up-to-date (recommended).
  - `program` : Force firmware programming regardless of current version.
- `-xb` : (Optional) Exclude a specific board type from the operation.
- `-v` : (Optional) Set verbosity level (0-3).
- `--parallel` : (Optional) Enable parallel updating of CAN boards of the same type under the same Ethernet connection. This can significantly speed up the firmware update process when multiple boards of the same type are present on the same network segment.

!!! tip
  
    Favor the `update` action over `program` to avoid unnecessary reprogramming. The `update` action checks versions and only updates when needed.

> **Note:** The `--parallel` option is particularly useful when updating multiple boards of the same type (e.g., multiple FOC boards) that are connected to the same Ethernet interface, as it allows simultaneous firmware updates instead of sequential processing.

### Monitor the Output

- The script will print progress and results to the terminal.
- If errors occur, check the XML files and connections.

### Additional Help

To see all available options and their descriptions, run:

```bash
python3 manageFWrobot.py --help
```


## Prerequisites

- Ensure you have a working Python 3 environment.
- Make sure the robot is powered on and connected to the network.
- You have the correct network and firmware info XML files for your robot. See the [troubleshooting](#troubleshooting) section for more information on the network file.
- Ensure the network and firmware info XML files are correct: the updater reads the network XML at runtime (via `yarp resource --from network.$YARP_ROBOT_NAME.xml`) and uses the firmware info XML to determine firmware versions and file paths — these XMLs control which boards are detected and which firmware will be applied during an automatic update.
- Run the automatic updater (manageFWrobot.py and the provided FirmwareUpdater.script.*.sh scripts) from a standalone terminal (e.g., gnome-terminal, terminator, xterm). Avoid running them from IDE integrated terminals such as Visual Studio Code's built-in terminal: those environments can alter environment variables or library paths and may cause Qt platform/plugin errors (for example, "This application failed to start because no Qt platform plugin could be initialized"). 

## Troubleshooting

- Use higher verbosity (`-v 2` or `-v 3`) for more detailed logs.

- The network XML used by the automated scripts is a runtime YARP resource. The scripts resolve it with:
  ```bash
  yarp resource --from network.$YARP_ROBOT_NAME.xml
  ```

- If the FirmwareUpdater scripts (for example `FirmwareUpdater.script.update.*.sh`) do not reflect recent changes of the network files or the automatic updater is not updating boards as expected, check the installed robot-specific files under the build/install tree. The installed robots and their network files are commonly found at:
  ```
  /usr/local/src/robot/robotology-superbuild/build/install/share/ICUBcontrib/robots/
  ```
  For example:
  ```
  /usr/local/src/robot/robotology-superbuild/build/install/share/ICUBcontrib/robots/iCubGenova11
  ```
  Inspect the robot folder there to find the effective network XML used by that robot and troubleshoot discrepancies.

- Wiring vs. network-file consistency
  - The network XML is a representation of the physical board network architecture. IP addresses, CAN bus IDs and board assignments declared in the network file must match the real electronic wiring and vice versa.
  - If you change wiring (IP, CAN addresses, or connector routing) update the network XML to match exactly. If you edit the network XML, verify the physical wiring matches the file before running the updater.
  - Quick checks:
    ```bash
    # show resolved network resource(s) used at runtime
    yarp resource --from network.$YARP_ROBOT_NAME.xml | sed 's/"//g'

    # inspect the resolved network file
    less "$(yarp resource --from network.$YARP_ROBOT_NAME.xml | sed 's/"//g' | head -n1)"

    # list installed robot folders (where deployed network files live)
    ls -l /usr/local/src/robot/robotology-superbuild/build/install/share/ICUBcontrib/robots/
    ```
  - If you find mismatches between wiring and network file, correct either the wiring or the network XML so they are coherent before attempting firmware updates.

- Electronic wiring / schematic reference
  - Wiring diagrams and electronic-schematics link: <https://github.com/icub-tech-iit/electronics-wiring-public>

- More troubleshooting and documentation:
  - [FirmwareUpdater online docs (troubleshooting & CAN id info)](https://icub-tech-iit.github.io/documentation/icub_firmware/firmwareupdater/firmwareupdater/?h=firm#change-can-id)
  - [FirmwareUpdater full details (GitHub)](https://github.com/robotology/icub-firmware-build/blob/master/docs/FirmwareUpdater.readme.fulldetails.txt)

---

Enjoy the firmware update process! If you encounter issues, consult the documentation or seek support from the iCub community.
