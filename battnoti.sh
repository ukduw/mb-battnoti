# mac - launchd + LaunchAgent, not systemd
    # write script
    # create .plist file
    # load it with launchctl

# battery info - pmset, e.g. pmset -g batt
# noti - osascript

#!/bin/bash

BATTERY=$(pmset -g batt | grep -o "[0-9]\+%" | tr -d '%')

if [ "$BATTERY" -le 20 ]; then
    osascript -e 'display notification "Battery is at '"$BATTERY"'%, buster" with title "Chaa deen la..."'
fi


# put in ~/bin/battnoti.sh
# chmod +x ~/bin/battnoti.sh