# logsession
`logsession` is a script that uses `script` (yep) to log your whole terminal session into a file for documentation purposes. It will update the log file in real time until the session terminates.
It takes a few arguments:
```
logsession -h
Usage: logsession [-d log_directory] [-f filename]
  -d  Set custom log directory
  -f  Set custom filename
```

`logsession` will run in the background when you start it and log everything to a default location of `$HOME/.logs/` with a name based on the current timestamp, unless otherwise configured.


Additionally, when `logsession` is running, the `clear` command is disabled. This is because running clear while `script` is running will wipe out all the logs previous to the `clear` command. I frequently run `clear` as a habit, so I decided to add this functionality. It is explained in the setup section.

## Setup
It is fairly simple to set up `logsession`:
```
git clone https://github.com/isand3/logsession
sudo logsession/scripts/setup.sh
sudo apt install coreutils util-linux
```
`setup.sh` will do two things:
  1. Add this code to your user's `.bashrc`
```
if pgrep -f "/usr/local/bin/logsession"; then
  echo "↑ PID"
  echo "Session is being logged -- clear is disabled."
  clear()
    {
    echo "Session is being logged -- clear is disabled."
    :
    }
fi
```
  2. Install logsession to `/usr/local/bin/logsession` requiring elevated privileges to run so that you can log more conveniently.

## Dependencies
Requires `coreutils` and `util-linux`.
Also requires you to use a bash shell.

