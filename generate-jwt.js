require('dotenv').config();
const jwt = require('jsonwebtoken');
const fs = require('fs');

// Get the JWT_SECRET from .env or use a default (for testing only)
const JWT_SECRET = process.env.JWT_SECRET || 'hearthgate_jwt_secret_for_testing';

// Create a payload
const payload = {
  sub: 'dwido906',                          // Subject (typically user ID)
  name: 'dwido906',                         // User name
  iat: Math.floor(Date.now() / 1000),       // Issued at (current time in seconds)
  exp: Math.floor(Date.now() / 1000) + 86400, // Expires in 24 hours
  role: 'admin'                             // User role
};

// Generate the token
const token = jwt.sign(payload, JWT_SECRET);

// Print the token
console.log('\nGenerated JWT Token:');
console.log(token);
console.log('\nToken details:');
console.log(JSON.stringify(payload, null, 2));
console.log('\nExpires at:', new Date(payload.exp * 1000).toISOString());
