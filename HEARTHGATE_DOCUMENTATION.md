# Hearthgate.xyz System Documentation

Last updated: 2025-07-11

## System Overview

- **Production URL**: https://hearthgate.xyz
- **Server**: DigitalOcean Droplet
- **Architecture**: MEAN Stack (MongoDB, Express, Angular, Node.js)
- **Deployment**: Docker containers with docker-compose
- **Database**: MongoDB (local Docker container)
- **Web Server**: Nginx (reverse proxy with SSL)

## Directory Structure

- `/home/dwido/frontend`: Frontend application code
- `/home/dwido/backend`: Backend API code
- `/home/dwido/mongodb_data`: MongoDB persistent data
- `/home/dwido/mongodb_backups`: Daily MongoDB backups

## Maintenance Procedures

### Daily Automated Tasks
- MongoDB backup at 3:00 AM UTC
- Log rotation for Docker containers

### Deployment of Updates
1. Pull new code: `cd ~/backend && git pull` or `cd ~/frontend && git pull`
2. Rebuild and restart containers: `cd ~ && docker-compose build && docker-compose up -d`

### Monitoring
- System status: `~/system-status.sh`
- Container logs: `docker-compose logs -f [service]`
- Nginx logs: `sudo tail -f /var/log/nginx/access.log`

### Backup & Restore
- Manual backup: `~/mongo-backup.sh`
- Restore from backup: `docker exec -i mongodb mongorestore --authenticationDatabase admin -u doadmin -p HearthGate2024! --archive < ~/mongodb_backups/[FILENAME]`

### SSL Certificate
- Auto-renewal via certbot
- Manual renewal if needed: `sudo certbot renew`

## Emergency Procedures

### Service Restart
- All containers: `docker-compose restart`
- Specific container: `docker-compose restart [service]`
- Nginx: `sudo systemctl restart nginx`

### Server Reboot
- `sudo reboot`
- Docker containers will auto-start via systemd service

## Security Notes

- MongoDB credentials are stored in docker-compose.yml
- SSL certificates managed by Let's Encrypt
- Regular system updates recommended: `sudo apt update && sudo apt upgrade`
