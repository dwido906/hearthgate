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
