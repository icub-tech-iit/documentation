# Setup `tmux` infinite scroll

Sometimes it is useful to run the `yarprobotinterface` directly from the terminal. By using `tmux`, you can detach from the SSH session. However, by default, the scrollback is not infinite, and not all messages are streamed to the logger.

To overcome this limitation:

1. Install xclip with:
  ```console
  sudo apt install xclip
  ```
2. Create a configuration file with:
  ```console
  touch ~/.tmux.conf
  ```
3. Set the following content in the configuration file:
  ```
  set -g mouse on
  set -g history-limit 100000
  ```
