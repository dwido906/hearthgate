#!/bin/bash
# Deployment script for Hearthgate

# Stop execution if any command fails
set -e

echo "=== Hearthgate Deployment Script ==="

# Navigate to project directory
cd /var/www/hearthgate

# Update NGINX configuration
echo "Configuring NGINX..."
sudo cp nginx/hearthgate.conf /etc/nginx/sites-available/
sudo ln -sf /etc/nginx/sites-available/hearthgate.conf /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx

# Set up SSL with Let's Encrypt
echo "Setting up SSL with Let's Encrypt..."
sudo certbot --nginx -d hearthgate.xyz -d www.hearthgate.xyz

# Start Docker containers
echo "Starting Docker containers..."
docker-compose down
docker-compose up -d

echo "=== Deployment complete! ==="
echo "Frontend: https://hearthgate.xyz"
echo "API: https://hearthgate.xyz/api"