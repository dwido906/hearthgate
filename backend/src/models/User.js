const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const userSchema = new mongoose.Schema({
  username: {
    type: String,
    required: true,
    unique: true,
    trim: true
  },
  email: {
    type: String,
    required: true,
    unique: true,
    trim: true,
    lowercase: true
  },
  password: {
    type: String,
    required: true,
    minlength: 6
  },
  role: {
    type: String,
    enum: ['user', 'admin'],
    default: 'user'
  },
  platforms: {
    discord: {
      connected: { type: Boolean, default: false },
      data: {
        id: String,
        username: String,
        discriminator: String,
        avatar: String,
        nitro: Boolean,
        guilds: Array,
        lastSync: Date
      },
      accessToken: String,
      refreshToken: String,
      lastSync: Date
    },
    steam: {
      connected: { type: Boolean, default: false },
      data: {
        steamId: String,
        profileName: String,
        avatar: String,
        games: Array,
        achievements: Array,
        playtime: Number,
        lastSync: Date
      },
      lastSync: Date
    },
    epic: {
      connected: { type: Boolean, default: false },
      data: {
        accountId: String,
        displayName: String,
        games: Array,
        stats: Object,
        lastSync: Date
      },
      accessToken: String,
      refreshToken: String,
      lastSync: Date
    },
    riot: {
      connected: { type: Boolean, default: false },
      data: {
        puuid: String,
        gameName: String,
        tagLine: String,
        ranks: Object,
        matchHistory: Array,
        lastSync: Date
      },
      accessToken: String,
      refreshToken: String,
      lastSync: Date
    },
    twitch: {
      connected: { type: Boolean, default: false },
      data: {
        id: String,
        login: String,
        displayName: String,
        followerCount: Number,
        streamStats: Object,
        lastSync: Date
      },
      accessToken: String,
      refreshToken: String,
      lastSync: Date
    }
  },
  gatescore: {
    overall: { type: Number, default: 0 },
    breakdown: {
      discord: { type: Number, default: 0 },
      steam: { type: Number, default: 0 },
      epic: { type: Number, default: 0 },
      riot: { type: Number, default: 0 },
      twitch: { type: Number, default: 0 }
    },
    lastCalculated: Date
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
});

// Hash password before saving
userSchema.pre('save', async function(next) {
  if (!this.isModified('password')) return next();
  try {
    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
    next();
  } catch (error) {
    next(error);
  }
});

// Method to compare passwords
userSchema.methods.comparePassword = async function(candidatePassword) {
  return bcrypt.compare(candidatePassword, this.password);
};

module.exports = mongoose.model('User', userSchema);
