#!/bin/bash

STATE_FILE20="/temp/low_battnoti20"     # note: does not persist over reboot; can lead to edge case...
STATE_FILE10="/temp/low_battnoti10"

BATTERY=$(pmset -g batt | grep -o "[0-9]\+%" | tr -d '%')

if [ "$BATTERY" -le 20 ] && [ "$BATTERY" -gt 10 ]; then     # 20 >= BATTERY > 10
    if [ ! -f "$STATE_FILE20" ]; then
        osascript -e 'display notification "Battery is at '"$BATTERY"'%, buster" with title "🪫 Chaa deen la..."'
        touch "$STATE_FILE20"
    fi
elif [ "$BATTERY" -le 10 ]; then    # 10 >= BATTERY
    if [ ! -f "$STATE_FILE10" ]; then
        osascript -e 'display notification "⚠️ BATTERY AT '"$BATTERY"'% ⚠️" with title "🪫 CHAA DEEN AH!"'
        touch "$STATE_FILE10"
    fi
else
    rm -f "$STATE_FILE20"
    rm -f "$STATE_FILE10"
fi

