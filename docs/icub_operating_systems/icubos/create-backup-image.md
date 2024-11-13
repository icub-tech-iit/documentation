# Create a backup image

For this step you need to have completed the [steps about the sdkManager](#jetpack-setup-on-the-host).
Make sure that the Xavier was started in [recovery mode](#booting-the-nvidia-jetson-board-in-recovery-mode) and it is found with `lsusb`.
On the host machine go to the `Linux_for_Tegra` folder and run:

```bash
cd ~/nvidia/nvidia_sdk/JetPack_<jetpack_ver>_Linux_<board_type>/Linux_for_Tegra
sudo ./flash.sh -r -k APP -G backup.img <board_identifier> mmcblk0p1
```

For example for flashing the NVIDIA Jetson Xavier NX, `board_identifier` is `jetson-xavier-nx-devkit-emmc`.

## Flashing a backup image

For this step you need to have completed the [steps about the sdkManager](#jetpack-setup-on-the-host) and also have successfully backed up a Jetpack image following [these steps](#create-a-backup-image).

```bash
cd ~/nvidia/nvidia_sdk/JetPack_<jetpack_ver>_Linux_<board_type>/Linux_for_Tegra
sudo mv bootloader/system.img* . #this save old image
sudo mv backup.img.raw bootloader/system.img #rename new image
sudo ./flash.sh -r jetson-xavier-nx-devkit-emmc mmcblk0p1
```
