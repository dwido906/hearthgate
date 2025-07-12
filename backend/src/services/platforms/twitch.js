const axios = require('axios');

class TwitchService {
  constructor() {
    this.baseURL = 'https://api.twitch.tv/helix';
    this.clientId = process.env.TWITCH_CLIENT_ID;
    this.clientSecret = process.env.TWITCH_CLIENT_SECRET;
  }

  /**
   * Get Twitch user data
   */
  async getUserData(accessToken) {
    try {
      const response = await axios.get(`${this.baseURL}/users`, {
        headers: {
          'Authorization': `Bearer ${accessToken}`,
          'Client-Id': this.clientId
        }
      });
      
      return response.data.data[0];
    } catch (error) {
      console.error('Twitch getUserData error:', error.response?.data || error.message);
      throw new Error('Failed to fetch Twitch user data');
    }
  }

  /**
   * Get Twitch channel followers
   */
  async getChannelFollowers(userId, accessToken) {
    try {
      const response = await axios.get(`${this.baseURL}/channels/followers`, {
        params: {
          broadcaster_id: userId
        },
        headers: {
          'Authorization': `Bearer ${accessToken}`,
          'Client-Id': this.clientId
        }
      });
      
      return response.data;
    } catch (error) {
      console.error('Twitch getChannelFollowers error:', error.response?.data || error.message);
      return { total: 0 };
    }
  }

  /**
   * Process Twitch data for Gatescore calculation
   */
  async processUserData(accessToken) {
    try {
      const userData = await this.getUserData(accessToken);
      const followersData = await this.getChannelFollowers(userData.id, accessToken);

      return {
        id: userData.id,
        login: userData.login,
        displayName: userData.display_name,
        followerCount: followersData.total || 0,
        streamStats: {
          // Placeholder for stream statistics
          totalStreams: 0,
          avgViewers: 0,
          hoursStreamed: 0
        },
        lastSync: new Date()
      };
    } catch (error) {
      console.error('Twitch processUserData error:', error);
      throw error;
    }
  }

  /**
   * Refresh Twitch access token
   */
  async refreshAccessToken(refreshToken) {
    try {
      const response = await axios.post('https://id.twitch.tv/oauth2/token', 
        new URLSearchParams({
          client_id: this.clientId,
          client_secret: this.clientSecret,
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
      console.error('Twitch refresh token error:', error.response?.data || error.message);
      throw new Error('Failed to refresh Twitch token');
    }
  }
}

module.exports = new TwitchService();