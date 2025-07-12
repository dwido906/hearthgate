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
