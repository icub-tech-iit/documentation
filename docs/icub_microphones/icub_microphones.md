# iCub Microphones
This page gives info about recording and playing back sound troght the `icub-head` microphones.

## Dependencies
For using the head microphones we must install the `PortAudio` on the head and local computer. 

- Install portaudio (in Ubuntu `sudo apt install portaudio19-dev`)
- In the cmake configurations, we should turn on four options by running ccmake . in the `yarp` folder:
  ```xml
  ENABLE_yarpmod_AudioPlayerWrapper ON
  ENABLE_yarpmod_AudioRecorderWrapper ON
  ENABLE_yarpmod_portaudio ON
  ENABLE_yarpmod_portaudioPlayer ON
  ENABLE_yarpmod_portaudioRecorder ON
  ```
- Run `make`

If you rely on [`robotology-superbuild`](https://github.com/robotology/robotology-superbuild), the configuration and the building process will automatically take care of the `portaudio`related options.
 
## Recording and Playback
 Recording and playback is supported in yarp via `libportaudio`, which wraps on the top of the linux device drivers.
 These yarp devices are [`portaudioPlayer`](http://www.yarp.it/git-master/classPortAudioPlayerDeviceDriver.html) and [`portaudioRecorder`](http://www.yarp.it/git-master/classPortAudioRecorderDeviceDriver.html), we need to enable them from ccmake when we compile yarp on the laptop (the option is avilable only if libportaudio needs to be installed). On icub, these devices are already enabled by default.
 
 Then, yarp has two network wrappers to send received audio data to/from the network. These devices are [`AudioPlayerWrapper`](http://www.yarp.it/git-master/classAudioPlayerWrapper.html) and `AudioRecorderWrapper`. Again, we need to check our yarp ccmake configuration to enable and compile them.

!!! warning "Deprecation Notice"

    From YARP-3.9.0, `AudioRecorderWrapper` has been deprecated in favor of the NWS/NWC network wrappers.
 
 We can record audio from a microphone and stream it over the network with the command:
 
 ```console
 yarpdev --device AudioRecorderWrapper --subdevice  portaudioRecorder --start
 ```
 
 On the other side, we can played some sound received from the network with:
 
 ```console
 yarpdev --device AudioPlayerWrapper --subdevice  portaudioPlayer --start
 ```
 
 We can connect the two modules with the command:
 
 ```console
 yarp connect /audioRecorderWrapper/audio:o /audioPlayerWrapper/audio:i fast_tcp
 ```
 
 The option --start will automatically enable the devices on startup; otherwise, we can start/stop the recording/playback by sending the command on the corresponding RPC ports.
 
All these devices/subdevices require some specific (and complex) options to work properly. These options are documented in the YARP doc pages linked above.

The parameters required by portaudioRecorder/portaudioPlayer are specific to the sound format (e.g. frequency, sample format etc).

The parameters required by AudioRecorderWrapper/AudioPlayerWrapper define the fragmentation of the sound packets over the network and the buffering options. We recommend using the default options.
Please note that buffering introduces some inevitable delay (five seconds by default), and that realtime audio playback is not currently supported (so we might hear some clicks, when a buffer underrun occurs).
 
## Use cases

### Processing audio in a application
 A different use case is processing audio in a application. To do this:
 
 - read the audio data directly from the `/audioPlayerRecorder/audio:o`  port
 - open an AudioPlayerWrapper in your module, using the standard polydriver.
 
Using the second option, the audio packets should be already assembled by the wrapper.
 
Finally, we also have some test devices:
 
 ```
 yarp_fakeMicrophone
 yarp_fakeSpeaker
 yarp_audioToFileDevice
 yarp_audioFromFileDevice
 ```
 
which can be used for testing/development purpose without the need of the real hardware.

### Grabbing audio from the microphones
If you launch the following on the icub-head:

```console
yarpdev --device AudioRecorderWrapper --subdevice portaudioRecorder --start
```

you'll get audio from icub microphones.

### Simulate a microphone
If you want to simulate a microphone, i.e. play a file from disk, type:

```console
yarpdev --device AudioRecorderWrapper --subdevice audioFromFileDevice --file_name myfile.wav --start
```

In both cases, the port opened by default by AudioRecorderWrapper is `/audioRecorderWrapper/audio:o``. You can check the options described in AudioRecorderWrapper.h if you want to choose a custom port name.

## References
- http://www.portaudio.com
