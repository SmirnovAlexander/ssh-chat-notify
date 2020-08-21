ssh-chat-notify
===============

`ssh-chat-notify` is a wrapper extension for normal `ssh-chat` by [@shazow](https://github.com/shazow). This forks data from `ssh` into a FIFO, which is then grepped every time you get a BEL alert from the `ssh-chat`. This is then converted into a notification action `notify-send` when on linux or `display notification` if on mac so you get desktop alerts. Feel free to modify script if you have other notification action.

![image](https://cloud.githubusercontent.com/assets/15330989/17787795/ab84f9a8-6558-11e6-82f1-826f4304f110.png)

## Requirements

* *nix OS
* openssh
* git

## Setup

Download repo and add `ssh-chat-notify` executable somewhere to your `PATH`.
``` bash
git clone https://github.com/sleibrock/ssh-chat-notify
cd ssh-chat-notify
chmod +x ssh-chat-notify
sudo mv ssh-chat-notify /usr/bin/
```

If on OSX set variable `OSX` to something not zero.
``` bash
vim /usr/bin/ssh-chat-notify
OSX=1
```

## Usage

Use `ssh-chat-notify` as you would use normal `ssh` command.
``` bash
ssh-chat-notify ssh.chat
```
``` bash
SSHCHAT_TIMESTAMP="time 3h" ssh-chat-notify -o SendEnv="SSHCHAT_TIMESTAMP" test@asmirnov.xyz -p 2022
```

## Credits

Mostly everything is credited to [@shazow](https://github.com/shazow) for helping me put this together. He also hosts `ssh-chat` and is cool for doing so.
