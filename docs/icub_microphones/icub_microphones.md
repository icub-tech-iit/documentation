# How to use microphones
Here you can find informations about using microphones placed on the iCub's head

## Using `yarpdev`
For using the head microphone  we must install the PortAudio on the head and local computer. 

- Install portaudio (in Ubuntu `sudo apt install portaudio19-dev`)
- Then in the cmake configurations, we should turn on four options by running ccmake . in the YARP folder in robotology superbuild:               
  ```xml
  ENABLE_yarpmod_AudioPlayerWrapper   ON
  ENABLE_yarpmod_AudioRecorderWrapper   ON
  ENABLE_yarpmod_portaudio  ON
  ENABLE_yarpmod_portaudioPlayer ON
  ENABLE_yarpmod_portaudioRecorder  ON
  ```
- then run make -j4 and make install 
- Also build ICUB
- then for running Module we need running  the `yarpdev --from startaudio.ini --rate 160000 --samples 16000`
- the startaudio.ini is a file that we putted on the home folder of icub-head that it includes following commands:

  ```
   device AudioRecorderWrapper
   subdevice portaudioRecorder
   name /microphone
   min_samples_over_network 4000
   max-samples_over_network 4000
  ```

 - Then we run the `yarphear` on the local computer

 - we connect  yarp hear and the microphone module on the head with `yarp connect /microphone/audio:o /yarphear`

- for increasing the volume of microphone on the head we run the `alsamixer` command in the head terminal and then we can increase the volume by `Mic boos` option.

- The last step is running following command in the local computer:
```
yarp rpc /microphone/rpc 
>>start
```
 and now we can hear the microphone voice by speaker of local computer.
## Using `portAudio`





