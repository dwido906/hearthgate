# Hearthgate Quick Reference

## Common Commands

### System
- Check status: `~/system-status.sh`
- View all containers: `docker ps -a`
- System resources: `htop`

### Services
- Restart all: `docker-compose restart`
- Restart one: `docker-compose restart [mongodb|backend|frontend]`
- View logs: `docker-compose logs -f [service]`
### Database
- Manual backup: `~/mongo-backup.sh`
- Connect to mongo: `docker exec -it mongodb mongosh -u doadmin -p HearthGate2024! --authenticationDatabase admin`

### Web
- Nginx config test: `sudo nginx -t`
- Restart Nginx: `sudo systemctl restart nginx`

## Important Locations
- Nginx config: `/etc/nginx/sites-available/hearthgate`
- SSL certificates: `/etc/letsencrypt/live/hearthgate.xyz/`
- Application code: `~/frontend` and `~/backend`
- Database data: `~/mongodb_data`
- Database backups: `~/mongodb_backups`
