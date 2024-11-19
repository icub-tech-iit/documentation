# Install the CUDA libraries

!!! info

    This procedure should be performed after the [JetPack installation](./jetpack.md) has been completed. 

Usually the Jetpack flashing procedure takes care of installing the Cuda toolkit and libraries. If running the command `nvcc --version` returns `Command not found`, then you need to install them manually though `apt`.

For example **Jetpack 4.5.1**, which uses **Cuda 10.2** do:

```bash
sudo apt install cuda-libraries-dev-10-1 cuda-nvcc-10-2
```

Then, within the `.bashrc`:

```bash
export CUDA_HOME=/usr/local/cuda-10.2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.2/lib64:/usr/local/cuda-10.2/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin
```
