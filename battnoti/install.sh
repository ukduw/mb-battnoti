#!/bin/bash
set -e

SCRIPT_NAME="battnoti.sh"
SERVICE_NAME="com.mb.battnoti"

SCRIPT_SRC="$(cd "$(dirname "$0")" && pwd)/$SCRIPT_NAME"
PLIST_SRC="$(cd "$(dirname "$0")" && pwd)/$SERVICE_NAME"

SCRIPT_DEST="/usr/local/bin/$SCRIPT_NAME"
PLIST_DEST="$HOME/Library/LaunchAgents/$SERVICE_NAME.plist"


mkdir -p /usr/local/bin
mkdir -p "$HOME/Library/LaunchAgents"

cp "$SCRIPT_SRC" "$SCRIPT_DEST"
cp "$PLIST_SRC" "$PLIST_DEST"

chmod +x "$SCRIPT_DEST"
chmod 644 "$PLIST_DEST"


launchctl bootout user/$(id -u) "$PLIST_DEST" 2>/dev/null || true    # unload if already loaded; reproducible

launchctl bootstrap user/$(id -u) "$PLIST_DEST"


echo "Successfully installed"


# mkdir if directories non-existent > cp over files, src to dest dir > chmod for executable > unload then load plist with launchctl