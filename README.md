# Claude Coder Koben Termux

Ce projet fournit une base pour exécuter des scripts dans l'environnement [Termux](https://termux.dev).

## Prérequis

Installer Termux puis les paquets nécessaires :

```bash
pkg update
pkg install git python nodejs
```

## Installation

Clonez ce dépôt dans votre espace de travail :

```bash
git clone <URL_DU_DEPOT>
cd Claude_Coder_Koben_termux
```

## Configuration

Ajoutez les variables d'environnement ou fichiers de configuration requis selon vos besoins. Exemple :

```bash
export EXEMPLE_CLE="valeur"
```

## Démarrage

Après configuration, lancez votre script principal. Exemple :

```bash
python script.py
```

## Utilisation de `screen` et `lldb`

Termux prend en charge des outils utiles pour la gestion de sessions et le débogage de programmes natifs.

Installez-les si nécessaire :

```bash
pkg install screen lldb
```

### `screen` : sessions persistantes

Créer une nouvelle session :

```bash
screen -S debug
```

Détacher la session : `Ctrl+a d`

Rejoindre une session existante :

```bash
screen -r debug
```

### `lldb` : débogage de binaires

Lancer un programme avec lldb :

```bash
lldb ./mon_programme
(lldb) run
```

## Included Scripts

### `setup-termux.sh`

Installe les dépendances requises pour l'environnement Termux.

**Prérequis :** script à exécuter dans Termux avec l'outil `pkg` disponible.

**Commande :**

```bash
./setup-termux.sh
```

### `bin/run-termux.sh`

Initialise les variables d'environnement Termux et lance un shell ou une commande fournie.

**Prérequis :** exécuté dans Termux. Les services `termux-wake-lock` et `sshd` sont démarrés s'ils sont installés.

**Commandes :**

```bash
bin/run-termux.sh            # ouvre un shell
bin/run-termux.sh python app.py   # exécute une commande
```

### `scripts/run_screen_debug.sh`

Démarre `lldb` dans une session `screen` détachée pour le débogage.

**Prérequis :** dépend de `screen` et `lldb` installés.

**Commande :**

```bash
scripts/run_screen_debug.sh [NOM_SESSION]
```

