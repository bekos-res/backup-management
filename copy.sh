#!/bin/bash

# Getting script directory.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Copying files of interest to directory.
cp /etc/rear/local.conf $SCRIPT_DIR
cp /root/Scripts/backup_the_system.sh $SCRIPT_DIR
