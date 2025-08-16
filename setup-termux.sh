#!/data/data/com.termux/files/usr/bin/bash
set -e

# Script d'installation pour Termux
# Met à jour pkg, installe les dépendances requises et vérifie l'installation.
# Vérifie aussi la connexion réseau avant toute mise à jour.

# Vérifie la présence de la commande pkg
if ! command -v pkg >/dev/null 2>&1; then
  echo "Ce script doit être exécuté dans Termux." >&2
  exit 1
fi

# Mise à jour et mise à niveau (échoue si le réseau est indisponible)
if ! pkg update -y; then
  echo "Connexion Internet requise. Veuillez vérifier votre réseau." >&2
  exit 1
fi
pkg upgrade -y

# Dépendances nécessaires et commandes associées
declare -A PKG_CMDS=(
  [git]=git
  [curl]=curl
  [python]=python
  [nodejs]=node
  [make]=make
  [clang]=clang
  [screen]=screen
  [lldb]=lldb
)

# Installation des dépendances
pkg install -y "${!PKG_CMDS[@]}"

# Vérifications post-installation
for pkg in "${!PKG_CMDS[@]}"; do
  cmd="${PKG_CMDS[$pkg]}"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "La commande $cmd (package $pkg) n'a pas été correctement installée." >&2
    exit 1
  fi
done

echo "Installation terminée avec succès."
