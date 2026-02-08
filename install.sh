#!/bin/bash
set -e

SCRIPT_NAME="battnoti.sh"
SERVICE_NAME="com.mb.battnoti"

SCRIPT_SRC="$(cd "$(dirname "$0")" && pwd)/$SCRIPT_NAME"
PLIST_SRC="$(cd "(dirname "$0")" && pwd)/$SERVICE_NAME"

SCRIPT_DEST="/usr/local/bin/$SCRIPT_NAME"
PLIST_DEST="$HOME/Library/LaunchAgents/$SERVICE_NAME.plist"


mkdir -p /usr/local/bin
mkdir -p "$HOME/Library/LaunchAgents"

