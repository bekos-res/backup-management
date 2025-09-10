#!/bin/bash

# TODO: Make abort cleanup, even though techically the script cleans even past files.

# NOTE: Important configuration in location /etc/rear/local.conf

# Variables
signature=$(date +%Y-%m-%d--%0k-%M-%S)

# Script to bypass the 'noexec' in LV /var/backup and /var
echo $(ls -lh /var/backup/archive)
echo -e "\nBacking things up at $signature...\n"
echo -e "IMPORTANT: DO NOT INTERRUPT THE SYSTEM OR MODIFY FILES. WAIT FOR CONFIRMATION THAT THIS PROCESS ENDED.\n\n"

# The backup command.
TMPDIR=/usr/local/tmp rear -v -D mkbackup
# NOTE:
# 1.	Using a temporary directory to bypass security 'noexec' applied to /var/backup.
# 2.	Debugging is on with "-D" option. Check logs with the command
# 		tail -n 50 /var/log/rear/rear-euterpe.log
# 	for 50 last log lines.

# By default, the files will be stored under /var/backup/$(hostname),
# but for proper storage they should be added in the archive,
# under a directory labeled with their unique timestamp signature.
echo -e "\nMoving files to /var/backup/archive/$signature-backup..."
mkdir /var/backup/archive/$signature-backup
mv /var/backup/$(hostname)/* /var/backup/archive/$signature-backup

# Deleting temporary files in temporary directory.
echo -e "\nCleaning after myself in /usr/local/tmp..."
rm -rf /usr/local/tmp/rear.*

echo -e "\n\nIMPORTANT: PROCESS ENDED SUCCESSFULLY."
