const axios = require('axios');

class DiscordService {
  constructor() {
    this.baseURL = 'https://discord.com/api/v10';
  }

  /**
   * Fetch Discord user data
   */
  async getUserData(accessToken) {
    try {
      const response = await axios.get(`${this.baseURL}/users/@me`, {
        headers: {
          'Authorization': `Bearer ${accessToken}`
        }
      });
      return response.data;
    } catch (error) {
      console.error('Discord getUserData error:', error.response?.data || error.message);
      throw new Error('Failed to fetch Discord user data');
    }
  }

  /**
   * Fetch Discord guilds (servers) for user
   */
  async getUserGuilds(accessToken) {
    try {
      const response = await axios.get(`${this.baseURL}/users/@me/guilds`, {
        headers: {
          'Authorization': `Bearer ${accessToken}`
        }
      });
      return response.data;
    } catch (error) {
      console.error('Discord getUserGuilds error:', error.response?.data || error.message);
      throw new Error('Failed to fetch Discord guilds');
    }
  }

  /**
   * Process Discord data for Gatescore calculation
   */
  async processUserData(accessToken) {
    try {
      const [userData, guilds] = await Promise.all([
        this.getUserData(accessToken),
        this.getUserGuilds(accessToken)
      ]);

      return {
        id: userData.id,
        username: userData.username,
        discriminator: userData.discriminator,
        avatar: userData.avatar,
        nitro: userData.premium_type > 0,
        guilds: guilds || [],
        lastSync: new Date()
      };
    } catch (error) {
      console.error('Discord processUserData error:', error);
      throw error;
    }
  }

  /**
   * Refresh Discord access token
   */
  async refreshAccessToken(refreshToken) {
    try {
      const response = await axios.post('https://discord.com/api/oauth2/token', 
        new URLSearchParams({
          client_id: process.env.DISCORD_CLIENT_ID,
          client_secret: process.env.DISCORD_CLIENT_SECRET,
          grant_type: 'refresh_token',
          refresh_token: refreshToken
        }),
        {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        }
      );
      
      return response.data;
    } catch (error) {
      console.error('Discord refresh token error:', error.response?.data || error.message);
      throw new Error('Failed to refresh Discord token');
    }
  }
}

module.exports = new DiscordService();