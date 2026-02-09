#!/bin/bash

SERVICE_NAME="com.mb.battnoti"

launchctl bootout gui/$(id -u) "$HOME/Library/LaunchAgents/$SERVICE_NAME.plist"

rm -f "$HOME/Library/LaunchAgents/$SERVICE_NAME.plist"
rm -f "/usr/local/bin/battnoti.sh"


echo "Successfully uninstalled"


# unload service > remove plist and script