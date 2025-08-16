#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO_URL="https://github.com/tu-usuario/Claude_Coder_Koben_termux.git"
REPO_DIR="$HOME/Claude_Coder_Koben_termux"

pkg update -y
pkg install -y git curl

if [ ! -d "$REPO_DIR" ]; then
  git clone "$REPO_URL" "$REPO_DIR"
else
  git -C "$REPO_DIR" pull
fi

cd "$REPO_DIR"
./setup-termux.sh

# Ejecuta un shell o la orden que se pase como argumento
bin/run-termux.sh "$@"
