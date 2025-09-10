#!/bin/bash

# NOT TODO: Make user-variable this script. Things such as backups should always be done as root.

# Getting script directory.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Pasting files in important directories.
# TODO: Make function handling directory creation and error handling.
# TODO: Make interface asking for overwriting already existing files.
cp $SCRIPT_DIR/local.conf /etc/rear/local.conf
cp $SCRIPT_DIR/backup_the_system.sh /root/Scripts/backup_the_system.sh
