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
