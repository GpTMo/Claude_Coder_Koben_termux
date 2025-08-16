#!/data/data/com.termux/files/usr/bin/env bash
set -euo pipefail
# Initialize Termux environment and optionally run a command.

# Standard Termux paths
export PREFIX="/data/data/com.termux/files/usr"
export HOME="/data/data/com.termux/files/home"
export PATH="$PREFIX/bin:$PATH"

# Start common Termux services if available
if command -v termux-wake-lock >/dev/null 2>&1; then
  termux-wake-lock
fi

if command -v sshd >/dev/null 2>&1; then
  sshd
fi

# Execute provided command or open a shell
if [ "$#" -gt 0 ]; then
  exec "$@"
else
  exec "${SHELL:-$PREFIX/bin/bash}"
fi
