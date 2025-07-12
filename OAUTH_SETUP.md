# Hearthgate OAuth Integration Setup Guide

## Overview
This guide will help you set up the OAuth integration system for Hearthgate, allowing users to connect their gaming accounts and calculate real Gatescores.

## Prerequisites
- Node.js 16+ and npm
- MongoDB instance
- Gaming platform developer accounts

## Quick Start

### 1. Backend Setup

```bash
cd backend
npm install
cp .env.template .env
# Edit .env with your credentials (see below)
npm start
```

### 2. Frontend Setup

```bash
cd frontend
npm install
npm start
```

## Environment Configuration

Copy `backend/.env.template` to `backend/.env` and configure:

### Required for Basic Functionality
```bash
# Database
MONGODB_URI=mongodb://localhost:27017/hearthgate

# JWT Security
JWT_SECRET=your-secure-jwt-secret-here
SESSION_SECRET=your-secure-session-secret-here

# Server URLs
CLIENT_URL=http://localhost:3000
SERVER_URL=http://localhost:3001
```

### OAuth Platform Credentials

#### Discord OAuth Setup
1. Go to https://discord.com/developers/applications
2. Create a new application
3. Go to OAuth2 section
4. Add redirect URI: `http://localhost:3001/api/auth/discord/callback`
5. Copy Client ID and Secret to .env:
```bash
DISCORD_CLIENT_ID=your-discord-client-id
DISCORD_CLIENT_SECRET=your-discord-client-secret
```

#### Steam API Setup
1. Go to https://steamcommunity.com/dev/apikey
2. Register for an API key with your domain
3. Add to .env:
```bash
STEAM_API_KEY=your-steam-api-key
```

#### Twitch OAuth Setup
1. Go to https://dev.twitch.tv/console/apps
2. Create a new application
3. Add OAuth redirect URL: `http://localhost:3001/api/auth/twitch/callback`
4. Add to .env:
```bash
TWITCH_CLIENT_ID=your-twitch-client-id
TWITCH_CLIENT_SECRET=your-twitch-client-secret
```

#### Epic Games (Requires Developer Access)
1. Apply for developer access at https://dev.epicgames.com/
2. Once approved, add to .env:
```bash
EPIC_CLIENT_ID=your-epic-client-id
EPIC_CLIENT_SECRET=your-epic-client-secret
```

#### Riot Games API
1. Go to https://developer.riotgames.com/
2. Get a development API key
3. Add to .env:
```bash
RIOT_API_KEY=your-riot-api-key
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login
- `GET /api/auth/profile` - Get user profile

### OAuth Platform Connections
- `GET /api/auth/discord` - Start Discord OAuth
- `GET /api/auth/discord/callback` - Discord OAuth callback
- `GET /api/auth/steam` - Start Steam OAuth
- `GET /api/auth/steam/callback` - Steam OAuth callback
- `POST /api/auth/twitch/connect` - Connect Twitch (manual token)

### Platform Management
- `GET /api/auth/platforms/status` - Get connection status
- `POST /api/auth/disconnect/:platform` - Disconnect platform
- `POST /api/auth/gatescore/recalculate` - Recalculate Gatescore

## Gatescore Algorithm

The Gatescore is calculated using a weighted system:

- **Discord (15%)**: Server count, Nitro status, account age
- **Steam (25%)**: Game library size, total playtime, achievements
- **Epic Games (15%)**: Game library, Fortnite performance
- **Riot Games (25%)**: Competitive ranks, match performance
- **Twitch (20%)**: Follower count, streaming activity

### Platform Scoring Details

#### Discord Score (Max: 1000)
- Base: 100 points
- Server count: 10 points per server (max 300)
- Nitro status: 200 points
- Account age: 1 point per 10 days (max 200)
- Profile completeness: up to 200 points

#### Steam Score (Max: 1000)
- Base: 100 points
- Game library: 5 points per game (max 400)
- Total playtime: 1 point per 100 hours (max 300)
- Achievement rate: 10 points per avg achievement per game (max 200)

## Testing the Integration

### 1. Start the Application
```bash
# Terminal 1 - Backend
cd backend && npm start

# Terminal 2 - Frontend
cd frontend && npm start
```

### 2. Register/Login
- Navigate to http://localhost:3000
- Create a new account or login
- You'll see the OAuth dashboard

### 3. Connect Platforms
- Click "Connect Discord" or "Connect Steam"
- Complete OAuth flow
- See real-time Gatescore updates

### 4. View Platform Data
- Check connection status
- See platform-specific data
- Monitor Gatescore breakdown

## Production Deployment

### Environment Variables for Production
```bash
NODE_ENV=production
CLIENT_URL=https://yourdomain.com
SERVER_URL=https://api.yourdomain.com
MONGODB_URI=mongodb://your-production-db/hearthgate
```

### OAuth Redirect URLs for Production
Update your OAuth applications with production URLs:
- Discord: `https://api.yourdomain.com/api/auth/discord/callback`
- Steam: `https://api.yourdomain.com/api/auth/steam/callback`
- Twitch: `https://api.yourdomain.com/api/auth/twitch/callback`

## Security Considerations

1. **Environment Variables**: Never commit .env files
2. **JWT Secrets**: Use strong, random secrets in production
3. **HTTPS**: Use HTTPS in production for OAuth callbacks
4. **Rate Limiting**: Implemented for API protection
5. **Token Storage**: OAuth tokens are encrypted in database
6. **CORS**: Configured for frontend domain only

## Troubleshooting

### Common Issues

#### "Connection Refused" Errors
- Ensure MongoDB is running
- Check port availability (3001 for backend, 3000 for frontend)

#### OAuth Errors
- Verify OAuth credentials in .env
- Check redirect URLs match exactly
- Ensure proper scopes are requested

#### Database Connection Issues
- Verify MongoDB URI format
- Check database permissions
- Ensure network connectivity

### Development Mode
For development without full OAuth setup:
- Set `MONGODB_URI=""` to run in demo mode
- Backend will start without database requirement
- Use frontend demo mode for UI testing

## Contributing

1. Fork the repository
2. Create feature branch
3. Implement changes with tests
4. Update documentation
5. Submit pull request

## Support

For issues and questions:
1. Check this documentation
2. Review error logs
3. Test with demo mode
4. Open GitHub issue with details

## Next Steps

1. Set up OAuth credentials for desired platforms
2. Configure MongoDB connection
3. Test platform connections
4. Deploy to production environment
5. Monitor Gatescore calculations
6. Add additional gaming platforms as needed