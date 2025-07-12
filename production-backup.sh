#!/bin/bash

# Production-grade MongoDB backup script
# Includes: compression, encryption, and retention policy

# Configuration
BACKUP_DIR="/home/dwido/mongodb_backups"
RETENTION_DAYS=7
ENCRYPTION_KEY="HearthgateBackupKey2025"  # In production, use a secure key management system
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="mongodb_backup_$DATE.archive"
COMPRESSED_FILE="$BACKUP_FILE.gz"
ENCRYPTED_FILE="$BACKUP_FILE.gz.enc"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Log start
echo "[$DATE] Starting production backup..."

# Create MongoDB backup
echo "Creating MongoDB dump..."
docker exec -i mongodb mongodump --authenticationDatabase admin -u doadmin -p HearthGate2024! --archive > $BACKUP_DIR/$BACKUP_FILE

# Check if backup was successful
if [ $? -ne 0 ]; then
    echo "ERROR: MongoDB backup failed!"
    exit 1
fi

# Compress the backup
echo "Compressing backup..."
gzip -f $BACKUP_DIR/$BACKUP_FILE

# Encrypt the compressed backup
echo "Encrypting backup..."
openssl enc -aes-256-cbc -salt -pbkdf2 -in $BACKUP_DIR/$COMPRESSED_FILE -out $BACKUP_DIR/$ENCRYPTED_FILE -k $ENCRYPTION_KEY

# Remove the unencrypted compressed file
rm $BACKUP_DIR/$COMPRESSED_FILE

# Implement retention policy - remove backups older than RETENTION_DAYS
echo "Applying retention policy ($RETENTION_DAYS days)..."
find $BACKUP_DIR -name "mongodb_backup_*.enc" -type f -mtime +$RETENTION_DAYS -delete

# Verify backup exists and has size > 0
if [ -s "$BACKUP_DIR/$ENCRYPTED_FILE" ]; then
    echo "[$DATE] Backup completed successfully: $ENCRYPTED_FILE ($(du -h $BACKUP_DIR/$ENCRYPTED_FILE | cut -f1))"
else
    echo "[$DATE] ERROR: Backup verification failed!"
    exit 1
fi

exit 0
