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
