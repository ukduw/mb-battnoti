placeholder


battery info - pmset, e.g. pmset -g batt   
noti - osascript

mac - launchd + LaunchAgent, not systemd
- write script
- create .plist file
- load it with launchctl

bash script
- put in usr/local/bin/battnoti.sh
- chmod +x usr/local/bin/battnoti.sh

plist
- put in ~/Library/LaunchAgents/com.mb.battnoti.plist
- launchctl load ~/Library/LaunchAgents/com.mb.battnoti.plist
- launchctl unload ~/Library/LaunchAgents/com.mb.battnoti.plist
    - load deprecated...? use bootstrap/bootout