#!/usr/bin/env bash
set -euo pipefail

# Run LLDB inside a named screen session for remote debugging.
# Usage: run_screen_debug.sh [SESSION_NAME]
# If no session name is provided, 'lldb-debug' is used by default.

SESSION_NAME="${1:-lldb-debug}"

if ! command -v screen >/dev/null 2>&1; then
  echo "Error: 'screen' is not installed. Please install it and retry." >&2
  exit 1
fi

# Start a detached screen session running lldb
screen -dmS "$SESSION_NAME" lldb

echo "Started detached screen session '$SESSION_NAME' running lldb."
echo "Useful commands:"
echo "  screen -ls                     # list sessions"
echo "  screen -r $SESSION_NAME        # attach to the session"
echo "  Ctrl+A D                      # detach from session"
echo "  screen -S $SESSION_NAME -X quit # terminate session"
