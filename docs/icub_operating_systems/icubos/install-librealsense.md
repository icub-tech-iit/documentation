# Install `librealsense` with Cuda support (OPTIONAL)

!!! info

    This procedure should be performed after the [JetPack installation](./jetpack.md) has been completed. 

`librealsense` is a cross-platform library provided by Intel that can be used to take advantage of the features of the Intel Realsense cameras.
After installing the [cuda libraries](./install-cuda-libraries.md), we can make the Realsense camera use also the gpu resources for better performances, enabling the cuda support.

In a terminal, clone the official repo with:

```bash
git clone https://github.com/IntelRealSense/librealsense.git
```

Install the librealsense required development packages:

```bash
sudo apt install libssl-dev freeglut3-dev libusb-1.0-0-dev pkg-config libgtk-3-dev unzip -y
```

Install the `udev` rules (the librealsense kernel patching procedure does not work with recent Jetpack versions):

```bash
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger
```

Now you are ready to compile librealsense with Cuda support:

```bash
cd librealsense
mkdir build && cd build
cmake ../ -DFORCE_LIBUVC=BOOL:ON -DCMAKE_BUILD_TYPE=Release -DBUILD_WITH_CUDA=BOOL:ON -DBUILD_EXAMPLE=BOOL:OFF
make -j2
sudo make install
```

For more information, refer to the [official documentation](https://github.com/IntelRealSense/librealsense/blob/master/doc/installation_jetson.md) provided in the repository.
