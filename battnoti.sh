# battery info - pmset, e.g. pmset -g batt
# noti - osascript


#!/bin/bash

STATE_FILE="/temp/low_battnoti"     # note: does not persist over reboot; can lead to edge case...

BATTERY=$(pmset -g batt | grep -o "[0-9]\+%" | tr -d '%')

if [ "$BATTERY" -le 20 ]; then
    if [ ! -f "$STATE_FILE" ]; then
        osascript -e 'display notification "Battery is at '"$BATTERY"'%, buster" with title "Chaa deen la..."'
        touch "$STATE_FILE"
    fi
else
    rm -f "$STATE_FILE"     # reset noti state when battery above threshold
fi


# mac - launchd + LaunchAgent, not systemd
    # write script
    # create .plist file
    # load it with launchctl

# bash script
    # put in ~/bin/battnoti.sh
    # chmod +x ~/bin/battnoti.sh

# plist
    # put in ~/Library/LaunchAgents/com.username.battnoti.plist
    # launchctl load ~/Library/LaunchAgents/com.username.battnoti.plist
    # launchctl unload ~/Library/LaunchAgents/com.username.battnoti.plist