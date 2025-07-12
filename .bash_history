
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
- Restore from backup: 

cat > ~/QUICK_REFERENCE.md << 'EOL'
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
EOL

sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades
cat > ~/HEARTHGATE_DOCUMENTATION.md << 'EOL'
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
- Restore from backup: 

cat > ~/HEARTHGATE_DOCUMENTATION.md << 'EOL'
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
- Restore from backup: 

# Create the full documentation file
sudo bash -c 'cat > /home/dwido/HEARTHGATE_DOCUMENTATION.md << "EOF"
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
- Restore from backup: 
# Create a basic documentation file first
cat > ~/HEARTHGATE_DOCS_PART1.txt << 'EOF'
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
EOF

# Second part
cat > ~/HEARTHGATE_DOCS_PART2.txt << 'EOF'
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
EOF

# Third part with the problematic section
cat > ~/HEARTHGATE_DOCS_PART3.txt << 'EOF'
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
EOF

# Now combine them
cat ~/HEARTHGATE_DOCS_PART1.txt ~/HEARTHGATE_DOCS_PART2.txt ~/HEARTHGATE_DOCS_PART3.txt > ~/HEARTHGATE_DOCUMENTATION.md
# Create the quick reference guide in parts too
cat > ~/QUICK_REFERENCE_PART1.txt << 'EOF'
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
EOF

cat > ~/QUICK_REFERENCE_PART2.txt << 'EOF'
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
EOF

# Combine quick reference parts
cat ~/QUICK_REFERENCE_PART1.txt ~/QUICK_REFERENCE_PART2.txt > ~/QUICK_REFERENCE.md
# Clean up the temporary files
rm ~/HEARTHGATE_DOCS_PART*.txt ~/QUICK_REFERENCE_PART*.txt
# Set up automatic security updates without interactive prompt
sudo apt install -y unattended-upgrades
echo 'APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::AutocleanInterval "7";' | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
# Create the full documentation file using nano
nano ~/HEARTHGATE_DOCUMENTATION.md
# Create the quick reference guide using nano
nano ~/QUICK_REFERENCE.md
# Run your system status script
~/system-status.sh
# Check if the site is accessible via HTTPS
curl -I https://hearthgate.xyz
# Navigate to backend directory
cd ~/backend
# Create user management module
mkdir -p src/routes/users
touch src/routes/users/user.model.js
touch src/routes/users/user.controller.js
touch src/routes/users/user.routes.js
# Install PM2 for process management
npm install -g pm2
# Set up basic monitoring
pm2 startup
pm2 save
# Add PM2 to docker-compose.yml for production monitoring
# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# Reload your profile to use NVM immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# Install the LTS version of Node.js
nvm install --lts
# Verify installation
node -v
npm -v
# Now you can install PM2 without sudo
npm install -g pm2
# Set up PM2
pm2 startup
# Follow the instructions it outputs
# Save the PM2 process list
pm2 save
# Update backend Dockerfile
cat > ~/backend/Dockerfile << 'EOF'
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

# Install PM2 globally in the container
RUN npm install -g pm2

# Use PM2 to start your application
CMD ["pm2-runtime", "src/index.js"]
EOF

# Update frontend Dockerfile
cat > ~/frontend/Dockerfile << 'EOF'
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

# Install PM2 globally in the container
RUN npm install -g pm2

# Build the React app
RUN npm run build

# Use PM2 to serve the static files
RUN npm install -g serve
CMD ["pm2-runtime", "start", "serve", "--", "-s", "build", "-l", "3000"]
EOF

# Then rebuild and restart containers
cd ~
docker-compose down
docker-compose build
docker-compose up -d
# Navigate to backend directory
cd ~/backend
# Install express-rate-limit
npm install express-rate-limit
# Create a rate limiting configuration file
cat > ~/backend/src/middleware/rateLimiter.js << 'EOF'
const rateLimit = require('express-rate-limit');

const apiLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
  standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
  legacyHeaders: false, // Disable the `X-RateLimit-*` headers
  message: { error: 'Too many requests, please try again later.' }
});

module.exports = apiLimiter;
EOF

# Now update your main Express application file to use the rate limiter
# First, let's create a backup of the original file
cp ~/backend/src/index.js ~/backend/src/index.js.bak
# Now update the index.js file to include rate limiting
cat > ~/backend/src/index.js << 'EOF'
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const apiLimiter = require('./middleware/rateLimiter');

const app = express();
const PORT = process.env.PORT || 3001;
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/hearthgate';

// Middleware
app.use(cors());
app.use(express.json());

// Apply rate limiting to all requests
app.use(apiLimiter);

// Database connection
mongoose.connect(MONGODB_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('Could not connect to MongoDB', err));

// Basic route
app.get('/api/status', (req, res) => {
  res.json({ status: 'ok', message: 'Hearthgate API is running!' });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
EOF

sudo # Navigate to backend directory
cd ~/backend
# Install express-rate-limit
npm install express-rate-limit
# Create a rate limiting configuration file
cat > ~/backend/src/middleware/rateLimiter.js << 'EOF'
const rateLimit = require('express-rate-limit');

const apiLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
  standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
  legacyHeaders: false, // Disable the `X-RateLimit-*` headers
  message: { error: 'Too many requests, please try again later.' }
});

module.exports = apiLimiter;
EOF

# Now update your main Express application file to use the rate limiter
# First, let's create a backup of the original file
cp ~/backend/src/index.js ~/backend/src/index.js.bak
# Now update the index.js file to include rate limiting
cat > ~/backend/src/index.js << 'EOF'
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const apiLimiter = require('./middleware/rateLimiter');

const app = express();
const PORT = process.env.PORT || 3001;
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/hearthgate';

// Middleware
app.use(cors());
app.use(express.json());

// Apply rate limiting to all requests
app.use(apiLimiter);

// Database connection
mongoose.connect(MONGODB_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('Could not connect to MongoDB', err));

// Basic route
app.get('/api/status', (req, res) => {
  res.json({ status: 'ok', message: 'Hearthgate API is running!' });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
EOF

cd
# Add production optimizations to backend Dockerfile
cat > ~/backend/Dockerfile << 'EOF'
FROM node:20-alpine

WORKDIR /app

# Install production dependencies only
COPY package*.json ./
RUN npm ci --only=production

# Copy application code
COPY . .

# Set production environment
ENV NODE_ENV=production

# Install PM2 for production process management
RUN npm install -g pm2

# Security: Run as non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Use PM2 in production mode
CMD ["pm2-runtime", "src/index.js"]
EOF

# Add production optimizations to frontend Dockerfile
cat > ~/frontend/Dockerfile << 'EOF'
FROM node:20-alpine as build

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build for production with optimizations
RUN npm run build

# Production image
FROM nginx:alpine

# Copy build files
COPY --from=build /app/build /usr/share/nginx/html

# Copy nginx config
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
EOF

# Create production-optimized docker-compose
cat > ~/docker-compose.yml << 'EOF'
version: '3'

services:
  mongodb:
    image: mongo:latest
    container_name: mongodb
    restart: always
    volumes:
      - ./mongodb_data:/data/db
    ports:
      - "27017:27017"
    environment:
      - MONGO_INITDB_ROOT_USERNAME=doadmin
      - MONGO_INITDB_ROOT_PASSWORD=HearthGate2024!
    command: ["--auth"]
    logging:
      options:
        max-size: "100m"
        max-file: "3"

  backend:
    build: ./backend
    container_name: hearthgate-backend
    restart: always
    depends_on:
      - mongodb
    ports:
      - "3001:3001"
    environment:
      - NODE_ENV=production
      - PORT=3001
      - MONGODB_URI=mongodb://doadmin:HearthGate2024!@mongodb:27017/admin?authSource=admin
      - JWT_SECRET=hearthgate-secure-token-2025-production
    logging:
      options:
        max-size: "100m"
        max-file: "3"

  frontend:
    build: ./frontend
    container_name: hearthgate-frontend
    restart: always
    ports:
      - "3000:80"
    depends_on:
      - backend
    logging:
      options:
        max-size: "100m"
        max-file: "3"
EOF

# Create nginx config directory for frontend
mkdir -p ~/frontend/nginx
# Create optimized nginx configuration
cat > ~/frontend/nginx/nginx.conf << 'EOF'
server {
    listen 80;
    
    # Compression settings
    gzip on;
    gzip_comp_level 5;
    gzip_min_length 256;
    gzip_proxied any;
    gzip_types
        application/javascript
        application/json
        application/x-javascript
        application/xml
        application/xml+rss
        image/svg+xml
        text/css
        text/javascript
        text/plain
        text/xml;
    
    # Caching settings
    location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
        expires 7d;
        add_header Cache-Control "public, max-age=604800, immutable";
    }
    
    # Handle SPA routing
    location / {
        root /usr/share/nginx/html;
        try_files $uri $uri/ /index.html;
        
        # Security headers
        add_header X-Frame-Options "SAMEORIGIN";
        add_header X-XSS-Protection "1; mode=block";
        add_header X-Content-Type-Options "nosniff";
        add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self' data:;";
        add_header Referrer-Policy "strict-origin-when-cross-origin";
    }
    
    # API proxy
    location /api/ {
        proxy_pass http://backend:3001/api/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# Create a production-grade database backup script
cat > ~/production-backup.sh << 'EOF'
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
EOF

chmod +x ~/production-backup.sh
# Schedule daily production backups
(crontab -l 2>/dev/null; echo "0 3 * * * /home/dwido/production-backup.sh >> /home/dwido/backup_logs.txt 2>&1") | crontab -
# Enable production logging
mkdir -p ~/logs
# Create production logging configuration
cat > ~/backend/src/config/logger.js << 'EOF'
const winston = require('winston');
const path = require('path');

// Define log format
const logFormat = winston.format.combine(
  winston.format.timestamp(),
  winston.format.json()
);

// Create logger instance
const logger = winston.createLogger({
  level: process.env.LOG_LEVEL || 'info',
  format: logFormat,
  defaultMeta: { service: 'hearthgate-api' },
  transports: [
    // Console logging
    new winston.transports.Console({
      format: winston.format.combine(
        winston.format.colorize(),
        winston.format.simple()
      )
    }),
    // File logging - errors
    new winston.transports.File({
      filename: path.join('/app/logs', 'error.log'),
      level: 'error'
    }),
    // File logging - all logs
    new winston.transports.File({
      filename: path.join('/app/logs', 'combined.log')
    })
  ]
});

module.exports = logger;
EOF

# Update backend to use production logging
cd ~/backend
npm install winston
# Create main systemd service for automatic startup
cat > ~/hearthgate.service << 'EOF'
[Unit]
Description=Hearthgate Production Service
After=network.target

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/home/dwido
ExecStart=/usr/bin/docker-compose up -d
ExecStop=/usr/bin/docker-compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target
EOF

# Install systemd service
sudo cp ~/hearthgate.service /etc/systemd/system/
sudo systemctl enable hearthgate.service
sudo systemctl daemon-reload
# Rebuild and restart everything for production
cd ~
docker-compose down
docker-compose build
docker-compose up -d
echo "PRODUCTION BUILD COMPLETED AND DEPLOYED"
# Fix backend Dockerfile to use npm install instead of npm ci
cat > ~/backend/Dockerfile << 'EOF'
FROM node:20-alpine

WORKDIR /app

# Install dependencies with regular npm install
COPY package*.json ./
RUN npm install --production

# Copy application code
COPY . .

# Set production environment
ENV NODE_ENV=production

# Install PM2 for production process management
RUN npm install -g pm2

# Use PM2 in production mode
CMD ["pm2-runtime", "src/index.js"]
EOF

# Fix frontend Dockerfile similarly
cat > ~/frontend/Dockerfile << 'EOF'
FROM node:20-alpine as build

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies with regular npm install
RUN npm install 

# Copy source code
COPY . .

# Build for production with optimizations
RUN npm run build

# Production image
FROM nginx:alpine

# Copy build files
COPY --from=build /app/build /usr/share/nginx/html

# Copy nginx config
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
EOF

# Create required directories
mkdir -p ~/frontend/nginx
mkdir -p ~/backend/src/middleware
mkdir -p ~/backend/src/config
# Create nginx config
cat > ~/frontend/nginx/nginx.conf << 'EOF'
server {
    listen 80;
    
    # Compression settings
    gzip on;
    gzip_comp_level 5;
    gzip_min_length 256;
    gzip_proxied any;
    gzip_types
        application/javascript
        application/json
        text/css
        text/plain;
    
    # Handle SPA routing
    location / {
        root /usr/share/nginx/html;
        try_files $uri $uri/ /index.html;
        
        # Security headers
        add_header X-Frame-Options "SAMEORIGIN";
        add_header X-XSS-Protection "1; mode=block";
        add_header X-Content-Type-Options "nosniff";
    }
    
    # API proxy
    location /api/ {
        proxy_pass http://backend:3001/api/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# Create the rate limiter middleware
cat > ~/backend/src/middleware/rateLimiter.js << 'EOF'
// Simple rate limiter implementation
const rateLimit = (maxRequests, timeWindow) => {
  const requests = {};
  
  return (req, res, next) => {
    const ip = req.ip || req.connection.remoteAddress;
    const now = Date.now();
    
    requests[ip] = requests[ip] || [];
    requests[ip] = requests[ip].filter(time => time > now - timeWindow);
    
    if (requests[ip].length < maxRequests) {
      requests[ip].push(now);
      next();
    } else {
      res.status(429).json({ error: 'Too many requests, please try again later' });
    }
  };
};

module.exports = rateLimit(100, 15 * 60 * 1000); // 100 requests per 15 minutes
EOF

# Create a simpler version of the backend index.js
cat > ~/backend/src/index.js << 'EOF'
const express = require('express');
const cors = require('cors');
const rateLimiter = require('./middleware/rateLimiter');

const app = express();
const PORT = process.env.PORT || 3001;
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/hearthgate';

// Middleware
app.use(cors());
app.use(express.json());
app.use(rateLimiter);

// Basic route
app.get('/api/status', (req, res) => {
  res.json({ status: 'ok', message: 'Hearthgate API is running!' });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
EOF

# Fix docker-compose with a simpler configuration
cat > ~/docker-compose.yml << 'EOF'
version: '3'

services:
  mongodb:
    image: mongo:latest
    container_name: mongodb
    restart: always
    volumes:
      - ./mongodb_data:/data/db
    ports:
      - "27017:27017"
    environment:
      - MONGO_INITDB_ROOT_USERNAME=doadmin
      - MONGO_INITDB_ROOT_PASSWORD=HearthGate2024!

  backend:
    build: ./backend
    container_name: hearthgate-backend
    restart: always
    depends_on:
      - mongodb
    ports:
      - "3001:3001"
    environment:
      - NODE_ENV=production
      - PORT=3001
      - MONGODB_URI=mongodb://doadmin:HearthGate2024!@mongodb:27017/admin?authSource=admin

  frontend:
    build: ./frontend
    container_name: hearthgate-frontend
    restart: always
    ports:
      - "3000:80"
    depends_on:
      - backend
EOF

# Create production backup script
cat > ~/mongo-backup.sh << 'EOF'
#!/bin/bash

# Simple production MongoDB backup script
BACKUP_DIR="/home/dwido/mongodb_backups"
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="mongodb_backup_$DATE.archive"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create MongoDB backup
echo "Creating MongoDB dump..."
docker exec -i mongodb mongodump --authenticationDatabase admin -u doadmin -p HearthGate2024! --archive > $BACKUP_DIR/$BACKUP_FILE

# Check if backup was successful
if [ $? -ne 0 ]; then
    echo "ERROR: MongoDB backup failed!"
    exit 1
fi

echo "Backup completed: $BACKUP_FILE"
exit 0
EOF

chmod +x ~/mongo-backup.sh
# Create systemd service file
cat > ~/hearthgate.service << 'EOF'
[Unit]
Description=Hearthgate Production Service
After=network.target

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/home/dwido
ExecStart=/usr/bin/docker-compose up -d
ExecStop=/usr/bin/docker-compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target
EOF

# Install systemd service
sudo cp ~/hearthgate.service /etc/systemd/system/
sudo systemctl enable hearthgate.service
sudo systemctl daemon-reload
# Restart with the fixed configuration
cd ~
docker-compose down
docker-compose build
docker-compose up -d
echo "PRODUCTION FIX DEPLOYED - SYSTEM SHOULD BE STABLE NOW"
# 1. Check running containers
docker ps
# 2. Test the API
curl http://localhost:3001/api/status
# 3. Verify frontend is running
curl -I http://localhost:3000
# 1. Create nginx config directory and config file
mkdir -p ~/frontend/nginx
cat > ~/frontend/nginx/nginx.conf << 'EOF'
server {
    listen 80;
    
    # Compression settings
    gzip on;
    gzip_comp_level 5;
    gzip_types text/plain text/css application/json application/javascript;
    
    location / {
        root /usr/share/nginx/html;
        try_files $uri $uri/ /index.html;
    }
    
    location /api/ {
        proxy_pass http://backend:3001/api/;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# 2. Set up automated daily backups
cat > ~/mongo-backup.sh << 'EOF'
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
EOF

chmod +x ~/mongo-backup.sh
# Schedule daily backups at 3 AM
(crontab -l 2>/dev/null; echo "0 3 * * * /home/dwido/mongo-backup.sh >> /home/dwido/backup.log 2>&1") | crontab -
# 3. Create simple system status script
cat > ~/system-status.sh << 'EOF'
#!/bin/bash

echo "======= Hearthgate System Status ======="
date

echo -e "\n=== Docker Containers ==="
docker ps

echo -e "\n=== Disk Space ==="
df -h | grep -v tmpfs

echo -e "\n=== Memory Usage ==="
free -h

echo -e "\n=== MongoDB Status ==="
echo "Connection test:"
docker exec -i mongodb mongosh -u doadmin -p HearthGate2024! --authenticationDatabase admin --quiet --eval "db.runCommand({ping:1})"

echo -e "\n=== API Status ==="
curl -s http://localhost:3001/api/status
EOF

chmod +x ~/system-status.sh
# Rebuild frontend with proper nginx config
cd ~
docker-compose up -d --build frontend
sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo apt install unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades
sudo apt install fail2ban
# Install Certbot and Nginx plugin
sudo apt update
sudo apt install certbot python3-certbot-nginx
# Obtain SSL certificate
sudo certbot --nginx -d hearthgate.xyz
# Test auto-renewal
sudo certbot renew --dry-run
# Create monitoring script
cat > ~/monitor.sh << 'EOF'
#!/bin/bash

# Simple monitoring script for Hearthgate

check_service() {
  if curl -s "http://localhost:$1/api/status" | grep -q "ok"; then
    echo "✅ API service is UP"
  else
    echo "❌ API service is DOWN!"
    # Send alert here (e.g., email)
  fi
}

check_frontend() {
  if curl -s -I "http://localhost:3000" | grep -q "200 OK"; then
    echo "✅ Frontend service is UP"
  else
    echo "❌ Frontend service is DOWN!"
    # Send alert here (e.g., email)
  fi
}

check_database() {
  if docker exec -i mongodb mongosh -u doadmin -p HearthGate2024! --authenticationDatabase admin --quiet --eval "db.runCommand({ping:1})" | grep -q "ok"; then
    echo "✅ MongoDB service is UP"
  else
    echo "❌ MongoDB service is DOWN!"
    # Send alert here (e.g., email)
  fi
}

echo "=== Hearthgate Monitoring Report ===" > /home/dwido/monitoring.log
date >> /home/dwido/monitoring.log
echo "" >> /home/dwido/monitoring.log

check_service 3001 >> /home/dwido/monitoring.log
check_frontend >> /home/dwido/monitoring.log
check_database >> /home/dwido/monitoring.log

# Check disk space
disk_usage=$(df -h | grep '/dev/vda1' | awk '{print $5}' | sed 's/%//')
if [ "$disk_usage" -gt 80 ]; then
  echo "⚠️ WARNING: Disk usage at ${disk_usage}%" >> /home/dwido/monitoring.log
fi

# Check memory
mem_usage=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
if [ "$mem_usage" -gt 80 ]; then
  echo "⚠️ WARNING: Memory usage at ${mem_usage}%" >> /home/dwido/monitoring.log
fi
EOF

chmod +x ~/monitor.sh
# Run monitoring every 15 minutes
(crontab -l 2>/dev/null; echo "*/15 * * * * /home/dwido/monitor.sh") | crontab -
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
cat > ~/PRODUCTION.md << 'EOF'
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
- **Update containers**: 
  ```bash
  cd ~
  git pull
  docker-compose down
  docker-compose build
  docker-compose up -d 
cat > ~/PRODUCTION.md << 'EOF'
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
- **Update containers**: 
  ```bash
  cd ~
  git pull
  docker-compose down
  docker-compose build
  docker-compose up -d

# Create the production documentation without nested code blocks
cat > ~/PRODUCTION.md << 'EOF'
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
EOF

# Install required packages
cd ~/backend
npm install jsonwebtoken bcrypt
# Create authentication middleware
mkdir -p src/middleware
touch src/middleware/auth.js
# Fix permissions for the backend directory
sudo chown -R dwido:dwido ~/backend
# Verify the ownership change
ls -la ~/backend
cd ~/backend
npm install jsonwebtoken bcrypt
# Create authentication middleware file
mkdir -p ~/backend/src/middleware
cat > ~/backend/src/middleware/auth.js << 'EOF'
const jwt = require('jsonwebtoken');

// Secret key should be stored in environment variables
const JWT_SECRET = process.env.JWT_SECRET || 'hearthgate-jwt-secret-key';

/**
 * Authentication middleware that verifies JWT tokens
 */
const auth = (req, res, next) => {
  try {
    // Get token from header
    const token = req.header('Authorization')?.split(' ')[1];
    
    if (!token) {
      return res.status(401).json({ message: 'No authentication token, access denied' });
    }
    
    // Verify token
    const verified = jwt.verify(token, JWT_SECRET);
    
    // Add user from payload to request
    req.user = verified;
    next();
  } catch (error) {
    res.status(401).json({ message: 'Invalid token, access denied' });
  }
};

module.exports = auth;
EOF

# Create User model
mkdir -p ~/backend/src/models
cat > ~/backend/src/models/User.js << 'EOF'
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const userSchema = new mongoose.Schema({
  username: {
    type: String,
    required: true,
    unique: true,
    trim: true
  },
  email: {
    type: String,
    required: true,
    unique: true,
    trim: true,
    lowercase: true
  },
  password: {
    type: String,
    required: true,
    minlength: 6
  },
  role: {
    type: String,
    enum: ['user', 'admin'],
    default: 'user'
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
});

// Hash password before saving
userSchema.pre('save', async function(next) {
  if (!this.isModified('password')) return next();
  try {
    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
    next();
  } catch (error) {
    next(error);
  }
});

// Method to compare passwords
userSchema.methods.comparePassword = async function(candidatePassword) {
  return bcrypt.compare(candidatePassword, this.password);
};

module.exports = mongoose.model('User', userSchema);
EOF

# Create auth routes
mkdir -p ~/backend/src/routes
cat > ~/backend/src/routes/auth.js << 'EOF'
const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const User = require('../models/User');
const auth = require('../middleware/auth');

// Secret key should be stored in environment variables
const JWT_SECRET = process.env.JWT_SECRET || 'hearthgate-jwt-secret-key';

// Register a new user
router.post('/register', async (req, res) => {
  try {
    const { username, email, password } = req.body;
    
    // Validate input
    if (!username || !email || !password) {
      return res.status(400).json({ message: 'Please enter all required fields' });
    }
    
    // Check if user exists
    const existingUser = await User.findOne({ $or: [{ email }, { username }] });
    if (existingUser) {
      return res.status(400).json({ message: 'User already exists' });
    }
    
    // Create user (password hashing is done in the pre-save hook)
    const newUser = new User({
      username,
      email,
      password
    });
    
    // Save user
    const savedUser = await newUser.save();
    
    res.status(201).json({
      message: 'User registered successfully'
    });
  } catch (err) {
    console.error('Registration error:', err);
    res.status(500).json({ message: 'Server error' });
  }
});

// Login user
router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;
    
    // Validate input
    if (!email || !password) {
      return res.status(400).json({ message: 'Please enter all required fields' });
    }
    
    // Check if user exists
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: 'Invalid credentials' });
    }
    
    // Validate password
    const isMatch = await user.comparePassword(password);
    if (!isMatch) {
      return res.status(400).json({ message: 'Invalid credentials' });
    }
    
    // Create token
    const token = jwt.sign(
      { id: user._id, role: user.role },
      JWT_SECRET,
      { expiresIn: '1d' }
    );
    
    res.json({
      token,
      user: {
        id: user._id,
        username: user.username,
        email: user.email,
        role: user.role
      }
    });
  } catch (err) {
    console.error('Login error:', err);
    res.status(500).json({ message: 'Server error' });
  }
});

// Get user profile (protected route)
router.get('/profile', auth, async (req, res) => {
  try {
    const user = await User.findById(req.user.id).select('-password');
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }
    res.json(user);
  } catch (err) {
    console.error('Profile error:', err);
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router;
EOF

# Update the main index.js to include auth routes
cat > ~/backend/src/index.js << 'EOF'
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const authRoutes = require('./routes/auth');

const app = express();
const PORT = process.env.PORT || 3001;
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/hearthgate';

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.use('/api/auth', authRoutes);

// Basic status route
app.get('/api/status', (req, res) => {
  res.json({ status: 'ok', message: 'Hearthgate API is running!' });
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Something went wrong!' });
});

// Database connection
mongoose.connect(MONGODB_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('Could not connect to MongoDB', err));

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
EOF

cd ~
docker-compose down
docker-compose build backend
docker-compose up -d
cat > ~/test-auth.sh << 'EOF'
#!/bin/bash

# Test the authentication API

API_URL="http://localhost:3001/api"
USERNAME="admin"
EMAIL="admin@hearthgate.xyz"
PASSWORD="SecurePassword123"

echo "Testing API Status..."
curl -s $API_URL/status | jq .

echo -e "\nRegistering a new user..."
REGISTER_RESPONSE=$(curl -s -X POST "$API_URL/auth/register" \
  -H "Content-Type: application/json" \
  -d "{\"username\": \"$USERNAME\", \"email\": \"$EMAIL\", \"password\": \"$PASSWORD\"}")
echo $REGISTER_RESPONSE | jq .

echo -e "\nLogging in..."
LOGIN_RESPONSE=$(curl -s -X POST "$API_URL/auth/login" \
  -H "Content-Type: application/json" \
  -d "{\"email\": \"$EMAIL\", \"password\": \"$PASSWORD\"}")
echo $LOGIN_RESPONSE | jq .

# Extract token from login response
TOKEN=$(echo $LOGIN_RESPONSE | jq -r '.token')

if [ "$TOKEN" != "null" ]; then
  echo -e "\nGetting user profile..."
  curl -s "$API_URL/auth/profile" \
    -H "Authorization: Bearer $TOKEN" | jq .
fi
EOF

chmod +x ~/test-auth.sh
apt-get update && apt-get install -y jq
~/test-auth.sh
# First, install jq with sudo
sudo apt-get update && sudo apt-get install -y jq
# Check the backend logs to see what's happening
docker-compose logs backend
# Let's verify the MongoDB connection first
cd ~
cat > ~/check-mongo.js << 'EOF'
// Connect to MongoDB and check connection
const mongoose = require('mongoose');
const MONGODB_URI = 'mongodb://doadmin:HearthGate2024!@localhost:27017/admin?authSource=admin';

mongoose.connect(MONGODB_URI)
  .then(() => {
    console.log('✅ Connected to MongoDB successfully');
    mongoose.connection.close();
  })
  .catch(err => {
    console.error('❌ MongoDB connection error:', err);
  });
EOF

# Run the connection test
node ~/check-mongo.js
~/test-auth.sh
# Install Certbot and nginx plugin
sudo apt update
sudo apt install -y certbot python3-certbot-nginx
# Configure nginx in docker-compose
cat > ~/frontend/nginx/nginx.conf << 'EOF'
server {
    listen 80;
    server_name hearthgate.xyz www.hearthgate.xyz;
    
    location / {
        root /usr/share/nginx/html;
        try_files $uri $uri/ /index.html;
    }
    
    location /api/ {
        proxy_pass http://backend:3001/api/;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# Update docker-compose to expose port 80 to host
cat > ~/docker-compose.yml << 'EOF'
version: '3'

services:
  mongodb:
    image: mongo:latest
    container_name: mongodb
    restart: always
    volumes:
      - ./mongodb_data:/data/db
    ports:
      - "27017:27017"
    environment:
      - MONGO_INITDB_ROOT_USERNAME=doadmin
      - MONGO_INITDB_ROOT_PASSWORD=HearthGate2024!

  backend:
    build: ./backend
    container_name: hearthgate-backend
    restart: always
    depends_on:
      - mongodb
    ports:
      - "3001:3001"
    environment:
      - NODE_ENV=production
      - PORT=3001
      - MONGODB_URI=mongodb://doadmin:HearthGate2024!@mongodb:27017/admin?authSource=admin
      - JWT_SECRET=hearthgate-secret-key-2025

  frontend:
    build: ./frontend
    container_name: hearthgate-frontend
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./certbot/conf:/etc/letsencrypt
      - ./certbot/www:/var/www/certbot
    depends_on:
      - backend
EOF

# Create directories for certbot
mkdir -p ~/certbot/conf
mkdir -p ~/certbot/www
# Rebuild and restart with the new configuration
docker-compose down
docker-compose up -d
# Once your domain is pointed to the server, run certbot
echo "When your domain is properly configured, run:"
echo "sudo certbot --nginx -d hearthgate.xyz -d www.hearthgate.xyz"
# Stop the frontend container
docker stop hearthgate-frontend
# Check what's using port 80
sudo lsof -i :80
# Configure nginx on the host as a reverse proxy
sudo tee /etc/nginx/sites-available/hearthgate.xyz << 'EOF'
server {
    listen 80;
    server_name hearthgate.xyz www.hearthgate.xyz;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /api/ {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

# Create symbolic link to enable the site
sudo ln -sf /etc/nginx/sites-available/hearthgate.xyz /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
# Test nginx configuration
sudo nginx -t
# If the test is successful, reload nginx
sudo systemctl reload nginx
# Update docker-compose.yml to use a different port for frontend
cat > ~/docker-compose.yml << 'EOF'
version: '3'

services:
  mongodb:
    image: mongo:latest
    container_name: mongodb
    restart: always
    volumes:
      - ./mongodb_data:/data/db
    ports:
      - "27017:27017"
    environment:
      - MONGO_INITDB_ROOT_USERNAME=doadmin
      - MONGO_INITDB_ROOT_PASSWORD=HearthGate2024!

  backend:
    build: ./backend
    container_name: hearthgate-backend
    restart: always
    depends_on:
      - mongodb
    ports:
      - "3001:3001"
    environment:
      - NODE_ENV=production
      - PORT=3001
      - MONGODB_URI=mongodb://doadmin:HearthGate2024!@mongodb:27017/admin?authSource=admin
      - JWT_SECRET=hearthgate-secret-key-2025

  frontend:
    build: ./frontend
    container_name: hearthgate-frontend
    restart: always
    ports:
      - "3000:80"  # Changed from 80:80 to 3000:80
    depends_on:
      - backend
EOF

# Restart Docker services
docker-compose up -d
# Run Certbot to obtain SSL certificate
sudo certbot --nginx -d hearthgate.xyz -d www.hearthgate.xyz
# Test auto-renewal
sudo certbot renew --dry-run
# Set up firewall
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
# Create a .gitignore to exclude database and sensitive files
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*

# Environment variables
.env
.env.local
.env.production

# Database
mongodb_data/
mongodb_backups/

# Logs
*.log
backup_logs.txt
monitoring.log

# System files
.DS_Store
.cache/
.pm2/

# SSH keys
.ssh/

# Docker
.docker/
EOF

# Now commit with the gitignore
git add .gitignore
git commit -m "Add .gitignore for sensitive data"
# Try the push again
git push -u origin main
# Create a .gitignore to exclude database and sensitive files
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*

# Environment variables
.env
.env.local
.env.production

# Database
mongodb_data/
mongodb_backups/

# Logs
*.log
backup_logs.txt
monitoring.log

# System files
.DS_Store
.cache/
.pm2/

# SSH keys
.ssh/

# Docker
.docker/
EOF

# Now commit with the gitignore
git add .gitignore
git commit -m "Add .gitignore for sensitive data"
# Try the push again
git push -u origin main
git remote add origin https://github.com/dwido906/hearthgate.git
git branch -M main
git push -u origin main
# Navigate to your HearthGate project folder
cd path/to/your/hearthgate
# Check what files you have
ls -la
# Check git status
git status
git init
git config --global init.defaultBranch main
git config --global user.name "dwido906"
git config --global user.email "dwido906@outlook.com"
git branch -m main
# If your HearthGate code is in a specific directory, navigate there
# For example, if it's in /var/www/hearthgate or /home/dwido/hearthgate
cd /path/to/your/hearthgate/project
# OR if you want to create a new directory for the project:
mkdir hearthgate
cd hearthgate
# Add your GitHub repository as origin
git remote add origin https://github.com/dwido906/hearthgate.git
dir
cd
dir
cd ~/hearthgate
ls -la
# You're already in the right place at /home/dwido/
cd /home/dwido/
# Let's see your current project structure
ls -la backend/
ls -la frontend/
# Check your backend structure
find backend/ -type f -name "*.js" -o -name "*.json" | head -10
# Check your frontend structure  
find frontend/ -type f -name "*.js" -o -name "*.jsx" -o -name "*.json" | head -10
# Check if you have git initialized here
git status
# Check your backend source files
ls -la backend/src/
cat backend/package.json
# Check your frontend source files
ls -la frontend/src/
cat frontend/src/App.js
# Check your backend source files
ls -la backend/src/
cat backend/package.json
# Check your frontend source files
ls -la frontend/src/
cat frontend/src/App.js
# Check your backend source files
ls -la backend/src/
cat backend/package.json
# Check your frontend source files
ls -la frontend/src/
cat frontend/src/App.js
git add .
git commit -m "Initial HearthGate setup - ready for OVER 9000 upgrade"
git push -u origin main
# Create a .gitignore to exclude database and sensitive files
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*

# Environment variables
.env
.env.local
.env.production

# Database
mongodb_data/
mongodb_backups/

# Logs
*.log
backup_logs.txt
monitoring.log

# System files
.DS_Store
.cache/
.pm2/

# SSH keys
.ssh/

# Docker
.docker/
EOF

# Now commit with the gitignore
git add .gitignore
git commit -m "Add .gitignore for sensitive data"
# Try the push again
git push -u origin main
# Create a .gitignore to exclude database and sensitive files
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*

# Environment variables
.env
.env.local
.env.production

# Database
mongodb_data/
mongodb_backups/

# Logs
*.log
backup_logs.txt
monitoring.log

# System files
.DS_Store
.cache/
.pm2/

# SSH keys
.ssh/

# Docker
.docker/
EOF

# Now commit with the gitignore
git add .gitignore
git commit -m "Add .gitignore for sensitive data"
# Try the push again
git push -u origin main
