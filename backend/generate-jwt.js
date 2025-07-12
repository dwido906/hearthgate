require('dotenv').config();
const crypto = require('crypto');

// Function to generate a strong random secret
const generateSecret = (length = 64) => {
  return crypto.randomBytes(length).toString('hex');
};

// Generate a new JWT secret
const JWT_SECRET = generateSecret();

console.log('\nGenerated JWT Secret:');
console.log(JWT_SECRET);
console.log('\nAdd this to your .env file as JWT_SECRET=YOUR_SECRET\n');
