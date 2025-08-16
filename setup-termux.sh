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

# Vérifie la connectivité réseau avant la mise à jour
if ! ping -c1 google.com >/dev/null 2>&1; then
  echo "Connexion Internet requise. Veuillez vérifier votre réseau." >&2
  exit 1
fi

# Mise à jour et mise à niveau
pkg update -y && pkg upgrade -y

# Dépendances nécessaires
DEPS=(git curl python nodejs make clang screen lldb)

# Installation des dépendances
pkg install -y "${DEPS[@]}"

# Vérifications post-installation
for dep in "${DEPS[@]}"; do
  if ! command -v "$dep" >/dev/null 2>&1; then
    echo "La dépendance $dep n'a pas été correctement installée." >&2
    exit 1
  fi
done

echo "Installation terminée avec succès."
