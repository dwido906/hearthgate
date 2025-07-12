# Hearthgate.xyz Production System

## System Architecture

- **Frontend**: Angular SPA served by Nginx
- **Backend**: Node.js API with PM2 process management
- **Database**: MongoDB with authentication
- **Deployment**: Docker containers orchestrated with docker-compose
- **Monitoring**: Custom monitoring scripts
- **Backup**: Daily automated MongoDB backups

## Routine Maintenance

- **View system status**: `~/system-status.sh`
- **Manual backup**: `~/mongo-backup.sh`
- **View logs**: `docker-compose logs -f [service]`
- **Update containers**: `cd ~ && git pull && docker-compose down && docker-compose build && docker-compose up -d`

## Emergency Procedures

### Service Restart

- **All services**: `docker-compose restart`
- **Single service**: `docker-compose restart [mongodb|backend|frontend]`
- **Nginx**: `sudo systemctl restart nginx`

### Restore from Backup

- List available backups: `ls -la ~/mongodb_backups/`
- Restore from backup: `docker exec -i mongodb mongorestore --authenticationDatabase admin -u doadmin -p HearthGate2024! --archive < ~/mongodb_backups/[FILENAME]`

### Server Migration

1. Back up MongoDB: `~/mongo-backup.sh`
2. Copy backup files to new server
3. Copy docker-compose.yml and Dockerfiles
4. Deploy using the same steps as original deployment

## Security Notes

- MongoDB credentials in docker-compose.yml
- HTTPS certificate auto-renews via Certbot
- Firewall limits access to necessary ports only
