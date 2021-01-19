# iCub Microphones
This page gives info about recording and playing back sound troght the `icub-head` microphones

## Dependencies
For using the head microphones we must install the `PortAudio` on the head and local computer. 

- Install portaudio (in Ubuntu `sudo apt install portaudio19-dev`)
- Then in the cmake configurations, we should turn on four options by running ccmake . in the `yarp` folder:               
  ```xml
  ENABLE_yarpmod_AudioPlayerWrapper   ON
  ENABLE_yarpmod_AudioRecorderWrapper   ON
  ENABLE_yarpmod_portaudio  ON
  ENABLE_yarpmod_portaudioPlayer ON
  ENABLE_yarpmod_portaudioRecorder  ON
  ```
- then run make -j4 

 
## Recording and Playback
 Recording and playback is supported in yarp via `libportaudio`, which wraps on the top of the linux device drivers.
 These yarp devices are `portaudioPlayer` (http://www.yarp.it/git-master/classPortAudioPlayerDeviceDriver.html) and `portaudioRecorder` (http://www.yarp.it/git-master/classPortAudioRecorderDeviceDriver.html), you need to enable them from ccmake when you compile yarp on your laptop (the option is avilable only if libportaudio needs to be installed). On icub, these devices are already enabled by default.
 
 Then, yarp has two network wrappers to send received audio data to/from the network. These devices are `AudioPlayerWrapper` (http://www.yarp.it/git-master/classAudioPlayerWrapper.html) and `AudioRecorderWrapper` (http://www.yarp.it/git-master/classAudioRecorderWrapper.html) . Again, you need to check your yarp ccmake configuration to enable and compile them.
 
 You can record audio from a microphone and stream it over the network with the command:
 
 ```
 yarpdev --device AudioRecorderWrapper --subdevice  portaudioRecorder --start
 ```
 
 On the other side, you can played some sound received from the network with:
 
 ```
 yarpdev --device AudioPlayerWrapper --subdevice  portaudioPlayer --start
 ```
 
 You can connect the two modules with the command:
 
 ```
 yarp connect /audioPlayerRecorder/audio:o /audioPlayerWrapper/audio:i tcp_fast
 ```
 
 The option --start will automatically enable the devices on startup. Otherwise you can start/stop the recording/playback by sending the command on the corresponding rpc ports.
 
 Now, the difficult part. All these devices/subdevices require some specific (and complex) options to work properly. These options are documented in the yarp pages I linked before. The parameters required by portaudioRecorder/portaudioPlayer are specific to the sound format (e.g. frequency, sample format etc). The parameters required by AudioRecorderWrapper/AudioPlayerWrapper define the fragmentation of the sound packets over the network and the buffering options. I recommend to use the default options.
 Please note that buffering introduces some inevitable delay (five seconds by default), and that realtime audio playback is not currently supported (so you might hear some clicks, when a buffer underrun occurs).
 
## Use case
 A different use case is processing audio in you application. To do this, you may:
 
 * read the audio data directly from the `/audioPlayerRecorder/audio:o`  port
 * open an AudioPlayerWrapper in your module, using the standard polydriver.
   If you use the second option, the audio packets should be already assembled by the wrapper.
 
 Finally, we also have some test devices:
 
 ```
 yarp_fakeMicrophone
 yarp_fakeSpeaker
 yarp_audioToFileDevice
 yarp_audioFromFileDevice
 ```
 
 which can be used for testing/development purpose without the need of the real hardware.

## References
- http://www.portaudio.com/




