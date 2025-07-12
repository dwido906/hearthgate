#!/bin/bash

BACKUP_DIR="/home/dwido/mongodb_backups"
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="mongodb_backup_$DATE.archive"

# Create backup directory
mkdir -p $BACKUP_DIR

# Create MongoDB backup
echo "Creating MongoDB backup: $BACKUP_FILE"
docker exec -i mongodb mongodump --authenticationDatabase admin -u doadmin -p HearthGate2024! --archive > $BACKUP_DIR/$BACKUP_FILE

# Check if backup was successful
if [ $? -ne 0 ]; then
    echo "ERROR: MongoDB backup failed!"
    exit 1
fi

echo "Backup completed successfully"
# Keep only the last 7 backups
ls -tp $BACKUP_DIR/*.archive | tail -n +8 | xargs -I {} rm -- {}
