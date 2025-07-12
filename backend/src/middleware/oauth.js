const passport = require('passport');
const DiscordStrategy = require('passport-discord').Strategy;
const SteamStrategy = require('passport-steam').Strategy;
const User = require('../models/User');

// OAuth configuration
const CLIENT_URL = process.env.CLIENT_URL || 'http://localhost:3000';

// Initialize Passport
passport.serializeUser((user, done) => {
  done(null, user._id);
});

passport.deserializeUser(async (id, done) => {
  try {
    const user = await User.findById(id);
    done(null, user);
  } catch (error) {
    done(error, null);
  }
});

// Discord OAuth Strategy
if (process.env.DISCORD_CLIENT_ID && process.env.DISCORD_CLIENT_SECRET) {
  passport.use(new DiscordStrategy({
    clientID: process.env.DISCORD_CLIENT_ID,
    clientSecret: process.env.DISCORD_CLIENT_SECRET,
    callbackURL: `${process.env.SERVER_URL || 'http://localhost:3001'}/api/auth/discord/callback`,
    scope: ['identify', 'guilds', 'email']
  }, async (accessToken, refreshToken, profile, done) => {
    try {
      // This strategy is used for connecting Discord to existing account
      // The actual user linking happens in the callback route
      return done(null, { profile, accessToken, refreshToken });
    } catch (error) {
      return done(error, null);
    }
  }));
}

// Steam OAuth Strategy
if (process.env.STEAM_API_KEY) {
  passport.use(new SteamStrategy({
    returnURL: `${process.env.SERVER_URL || 'http://localhost:3001'}/api/auth/steam/callback`,
    realm: process.env.SERVER_URL || 'http://localhost:3001',
    apiKey: process.env.STEAM_API_KEY
  }, async (identifier, profile, done) => {
    try {
      // Extract Steam ID from identifier
      const steamId = identifier.split('/').pop();
      return done(null, { profile, steamId });
    } catch (error) {
      return done(error, null);
    }
  }));
}

// OAuth state management middleware
const oauthState = (req, res, next) => {
  // Store user ID in session for OAuth linking
  if (req.user && req.user.id) {
    req.session.userId = req.user.id;
  }
  next();
};

// Verify OAuth state middleware
const verifyOAuthState = (req, res, next) => {
  if (!req.session.userId) {
    return res.status(401).json({ 
      message: 'OAuth state invalid. Please log in first.' 
    });
  }
  next();
};

module.exports = {
  passport,
  oauthState,
  verifyOAuthState
};