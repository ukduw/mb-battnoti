#!/bin/bash

STATE_FILE20="/temp/low_battnoti20"     # note: does not persist over reboot; can lead to edge case...
STATE_FILE10="/temp/low_battnoti10"

BATTERY=$(pmset -g batt | grep -o "[0-9]\+%" | tr -d '%')

if [ "$BATTERY" -le 20 ]; then
    if [ ! -f "$STATE_FILE20" ]; then
        osascript -e 'display notification "Battery is at '"$BATTERY"'%, buster" with title "🪫 Chaa deen la..."'
        touch "$STATE_FILE20"
    fi
else
    rm -f "$STATE_FILE20"
    rm -f "$STATE_FILE10"
fi


# battery info - pmset, e.g. pmset -g batt
# noti - osascript

# mac - launchd + LaunchAgent, not systemd
    # write script
    # create .plist file
    # load it with launchctl

# bash script
    # put in usr/local/bin/battnoti.sh
    # chmod +x usr/local/bin/battnoti.sh

# plist
    # put in ~/Library/LaunchAgents/com.mb.battnoti.plist
    # launchctl load ~/Library/LaunchAgents/com.mb.battnoti.plist
    # launchctl unload ~/Library/LaunchAgents/com.mb.battnoti.plist

    # load deprecated...? use bootstrap