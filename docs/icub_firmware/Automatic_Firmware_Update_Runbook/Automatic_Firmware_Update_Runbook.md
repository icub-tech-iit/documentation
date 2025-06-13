# Automatic Firmware Update

This guide explains how to perform an automatic firmware update for iCub robots using the `manageFWrobot.py` script, which is located in `robotology-superbuild/src/icub-firmware-build/scripts/`.

# 1. Automated Firmware Update (AFU) Using Provided Scripts

The recommended way to perform a firmware update is to use the provided bash scripts in the `scripts` directory. These scripts simplify the process by automatically selecting the correct configuration files and options for your robot.

### 1.1 Navigate to the Scripts Directory

Open a terminal and change directory to:

```bash
cd /path/to/robotology-superbuild/src/icub-firmware-build/scripts
```

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

### IMPORTANT SIDENOTES : 

- **Always use the provided scripts unless you have a special need. Try to double check the details**
- **Do not edit scripts unless you understand the options.**
- **Check logs in the `../logs/` directory after running a script.**

> For advanced customization, see the [Step-by-Step Procedure](#step-by-step-procedure) below.

---

# 2. Automatic Firmware Update (AFU) by launching the manageFWrobot.py

If you need more control or want to understand the underlying process, you can use the `manageFWrobot.py` script directly.

## Prerequisites

- Ensure you have a working Python 3 environment.
- Make sure the robot is powered on and connected to the network.
- You have the correct network and firmware info XML files for your robot.

## Step-by-Step Procedure

### 2.1 Prepare the XML Files

- **Network XML file (`-n`)**: Describes the robot's board configuration (e.g., `network.iCubGenova02.xml`).  
  Location: `robotology-superbuild/src/robots-configuration/`
- **Firmware info XML file (`-f`)**: Lists firmware versions and file paths (e.g., `firmware.info.xml`).  
  Location: `robotology-superbuild/src/icub-firmware-build/info/`

> **Note:** Always verify that the firmware info file contains the correct versions and paths for your update.

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

#### Example

```bash
./manageFWrobot.py -n network.iCubGenova02.xml -f ../info/firmware.info.xml -p left_leg -b foc -a update
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

> **Tip:** Prefer using the `update` action over `program` to avoid unnecessary reprogramming. The `update` action checks versions and only updates when needed.

### Monitor the Output

- The script will print progress and results to the terminal.
- If errors occur, check the XML files and connections.

### Additional Help

To see all available options and their descriptions, run:

```bash
python3 manageFWrobot.py --help
```

## Troubleshooting

- Ensure all XML files are correct and accessible.
- Check network connectivity to the robot.
- Use higher verbosity (`-v 2` or `-v 3`) for more detailed logs.

## References

- [FirmwareUpdater Online Documentation](https://icub-tech-iit.github.io/documentation/icub_firmware/firmwareupdater/firmwareupdater/?h=firm#change-can-id)
- [FirmwareUpdater Full Details (GitHub)](https://github.com/robotology/icub-firmware-build/blob/master/docs/FirmwareUpdater.readme.fulldetails.txt)

---

Enjoy the firmware update process! If you encounter issues, consult the documentation or seek support from the iCub community.