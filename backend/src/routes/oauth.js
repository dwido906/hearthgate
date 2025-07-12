const express = require('express');
const router = express.Router();
const { passport, oauthState, verifyOAuthState } = require('../middleware/oauth');
const auth = require('../middleware/auth');
const User = require('../models/User');
const { updateUserGatescore } = require('../services/gatescore');

// Platform services
const discordService = require('../services/platforms/discord');
const steamService = require('../services/platforms/steam');
const epicService = require('../services/platforms/epic');
const riotService = require('../services/platforms/riot');
const twitchService = require('../services/platforms/twitch');

// Discord OAuth Routes
router.get('/discord', auth, oauthState, passport.authenticate('discord'));

router.get('/discord/callback', verifyOAuthState, passport.authenticate('discord', { 
  session: false 
}), async (req, res) => {
  try {
    const user = await User.findById(req.session.userId);
    if (!user) {
      return res.redirect(`${process.env.CLIENT_URL || 'http://localhost:3000'}?error=user_not_found`);
    }

    const { profile, accessToken, refreshToken } = req.user;
    
    // Process Discord data
    const discordData = await discordService.processUserData(accessToken);
    
    // Update user's Discord connection
    user.platforms.discord = {
      connected: true,
      data: discordData,
      accessToken: accessToken,
      refreshToken: refreshToken,
      lastSync: new Date()
    };

    await user.save();
    
    // Recalculate Gatescore
    await updateUserGatescore(user);

    res.redirect(`${process.env.CLIENT_URL || 'http://localhost:3000'}?platform=discord&status=connected`);
  } catch (error) {
    console.error('Discord callback error:', error);
    res.redirect(`${process.env.CLIENT_URL || 'http://localhost:3000'}?error=discord_connection_failed`);
  }
});

// Steam OAuth Routes
router.get('/steam', auth, oauthState, passport.authenticate('steam'));

router.get('/steam/callback', verifyOAuthState, passport.authenticate('steam', { 
  session: false 
}), async (req, res) => {
  try {
    const user = await User.findById(req.session.userId);
    if (!user) {
      return res.redirect(`${process.env.CLIENT_URL || 'http://localhost:3000'}?error=user_not_found`);
    }

    const { steamId } = req.user;
    
    // Process Steam data
    const steamData = await steamService.processUserData(steamId);
    
    // Update user's Steam connection
    user.platforms.steam = {
      connected: true,
      data: steamData,
      lastSync: new Date()
    };

    await user.save();
    
    // Recalculate Gatescore
    await updateUserGatescore(user);

    res.redirect(`${process.env.CLIENT_URL || 'http://localhost:3000'}?platform=steam&status=connected`);
  } catch (error) {
    console.error('Steam callback error:', error);
    res.redirect(`${process.env.CLIENT_URL || 'http://localhost:3000'}?error=steam_connection_failed`);
  }
});

// Epic Games OAuth Routes (placeholder)
router.get('/epic', auth, (req, res) => {
  res.status(501).json({ 
    message: 'Epic Games OAuth not fully implemented - requires developer access' 
  });
});

router.get('/epic/callback', (req, res) => {
  res.redirect(`${process.env.CLIENT_URL || 'http://localhost:3000'}?error=epic_not_implemented`);
});

// Riot Games OAuth Routes (placeholder)
router.get('/riot', auth, (req, res) => {
  res.status(501).json({ 
    message: 'Riot Games OAuth not fully implemented - requires API access' 
  });
});

router.get('/riot/callback', (req, res) => {
  res.redirect(`${process.env.CLIENT_URL || 'http://localhost:3000'}?error=riot_not_implemented`);
});

// Twitch OAuth Routes (placeholder for manual token entry)
router.post('/twitch/connect', auth, async (req, res) => {
  try {
    const { accessToken, refreshToken } = req.body;
    
    if (!accessToken) {
      return res.status(400).json({ message: 'Access token required' });
    }

    const user = await User.findById(req.user.id);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Process Twitch data
    const twitchData = await twitchService.processUserData(accessToken);
    
    // Update user's Twitch connection
    user.platforms.twitch = {
      connected: true,
      data: twitchData,
      accessToken: accessToken,
      refreshToken: refreshToken,
      lastSync: new Date()
    };

    await user.save();
    
    // Recalculate Gatescore
    await updateUserGatescore(user);

    res.json({ 
      message: 'Twitch connected successfully',
      platform: 'twitch',
      data: twitchData
    });
  } catch (error) {
    console.error('Twitch connect error:', error);
    res.status(500).json({ message: 'Failed to connect Twitch account' });
  }
});

// Disconnect platform
router.post('/disconnect/:platform', auth, async (req, res) => {
  try {
    const { platform } = req.params;
    const validPlatforms = ['discord', 'steam', 'epic', 'riot', 'twitch'];
    
    if (!validPlatforms.includes(platform)) {
      return res.status(400).json({ message: 'Invalid platform' });
    }

    const user = await User.findById(req.user.id);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Reset platform connection
    user.platforms[platform] = {
      connected: false,
      data: {},
      accessToken: undefined,
      refreshToken: undefined,
      lastSync: undefined
    };

    await user.save();
    
    // Recalculate Gatescore
    await updateUserGatescore(user);

    res.json({ 
      message: `${platform} disconnected successfully`,
      platform: platform
    });
  } catch (error) {
    console.error('Platform disconnect error:', error);
    res.status(500).json({ message: 'Failed to disconnect platform' });
  }
});

// Get connected platforms status
router.get('/platforms/status', auth, async (req, res) => {
  try {
    const user = await User.findById(req.user.id).select('platforms gatescore');
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    const platformStatus = {};
    const platforms = ['discord', 'steam', 'epic', 'riot', 'twitch'];
    
    platforms.forEach(platform => {
      platformStatus[platform] = {
        connected: user.platforms[platform]?.connected || false,
        lastSync: user.platforms[platform]?.lastSync || null
      };
    });

    res.json({
      platforms: platformStatus,
      gatescore: user.gatescore
    });
  } catch (error) {
    console.error('Platform status error:', error);
    res.status(500).json({ message: 'Failed to get platform status' });
  }
});

// Manually recalculate Gatescore
router.post('/gatescore/recalculate', auth, async (req, res) => {
  try {
    const user = await User.findById(req.user.id);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    const gatescore = await updateUserGatescore(user);

    res.json({
      message: 'Gatescore recalculated successfully',
      gatescore: gatescore
    });
  } catch (error) {
    console.error('Gatescore recalculation error:', error);
    res.status(500).json({ message: 'Failed to recalculate Gatescore' });
  }
});

module.exports = router;