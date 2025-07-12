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
