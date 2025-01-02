# Install `librealsense` with Cuda support

!!! info

    This procedure should be performed after the [JetPack installation](./jetpack.md) has been completed. 

`librealsense` is a cross-platform library provided by Intel that can be used to take advantage of the features of the Intel Realsense cameras.
After installing the [cuda libraries](./install-cuda-libraries.md), we can make the Realsense camera use also the gpu resources for better performances, enabling the cuda support.

The installation procedure depends on the Jetpack version installed on your board.

## Jetpack 5.x.x

On Jetson board flashed with `Jetpack version 5.x.x`, you can follow the instructions to install `librealsense` with [Debian packages](https://github.com/IntelRealSense/librealsense/blob/master/doc/installation_jetson.md#4-install-with-debian-packages).

## Jetpack 6.x.x

For Jetson Orin with `Jetpack version ≥ 6.0.0`, the proper procedure is to install this library [from source using the RSUSB backend](https://github.com/IntelRealSense/librealsense/blob/master/doc/installation_jetson.md#building-from-source-using-rsusb-backend), following the [libuvc_installation.sh](https://github.com/IntelRealSense/librealsense/blob/master/scripts/libuvc_installation.sh) script.

First of all, clone the `librealsense` official repository, and then navigate into the `scripts` folder:

```sh
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense/scripts
```

For optimal performances, edit the script adding the following CMake options:

```cmake
-DFORCE_RSUSB_BACKEND=ON -DBUILD_WITH_CUDA=ON
```

In the end, run the script:

```sh
./libuvc_installation.sh
```

For more information, refer to the [official documentation](https://github.com/IntelRealSense/librealsense/blob/master/doc/installation_jetson.md) provided in the repository.
