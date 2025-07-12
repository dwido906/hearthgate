const axios = require('axios');

class SteamService {
  constructor() {
    this.baseURL = 'https://api.steampowered.com';
    this.apiKey = process.env.STEAM_API_KEY;
  }

  /**
   * Get Steam user profile
   */
  async getUserProfile(steamId) {
    try {
      const response = await axios.get(
        `${this.baseURL}/ISteamUser/GetPlayerSummaries/v0002/`,
        {
          params: {
            key: this.apiKey,
            steamids: steamId
          }
        }
      );
      
      return response.data.response.players[0];
    } catch (error) {
      console.error('Steam getUserProfile error:', error.response?.data || error.message);
      throw new Error('Failed to fetch Steam profile');
    }
  }

  /**
   * Get Steam user's owned games
   */
  async getUserGames(steamId) {
    try {
      const response = await axios.get(
        `${this.baseURL}/IPlayerService/GetOwnedGames/v0001/`,
        {
          params: {
            key: this.apiKey,
            steamid: steamId,
            format: 'json',
            include_appinfo: true,
            include_played_free_games: true
          }
        }
      );
      
      return response.data.response.games || [];
    } catch (error) {
      console.error('Steam getUserGames error:', error.response?.data || error.message);
      return []; // Return empty array if games are private
    }
  }

  /**
   * Get Steam user achievements for a specific game
   */
  async getUserAchievements(steamId, appId) {
    try {
      const response = await axios.get(
        `${this.baseURL}/ISteamUserStats/GetPlayerAchievements/v0001/`,
        {
          params: {
            key: this.apiKey,
            steamid: steamId,
            appid: appId
          }
        }
      );
      
      return response.data.playerstats.achievements || [];
    } catch (error) {
      // Don't log error as this is common when user has no achievements or game is private
      return [];
    }
  }

  /**
   * Process Steam data for Gatescore calculation
   */
  async processUserData(steamId) {
    try {
      const [profile, games] = await Promise.all([
        this.getUserProfile(steamId),
        this.getUserGames(steamId)
      ]);

      // Calculate total playtime
      const totalPlaytime = games.reduce((total, game) => {
        return total + (game.playtime_forever || 0);
      }, 0);

      // Get achievements for top 5 most played games
      const topGames = games
        .sort((a, b) => (b.playtime_forever || 0) - (a.playtime_forever || 0))
        .slice(0, 5);

      let allAchievements = [];
      for (const game of topGames) {
        try {
          const achievements = await this.getUserAchievements(steamId, game.appid);
          allAchievements = allAchievements.concat(achievements);
        } catch (error) {
          // Continue with other games if one fails
          continue;
        }
      }

      return {
        steamId: steamId,
        profileName: profile.personaname,
        avatar: profile.avatarfull,
        games: games,
        achievements: allAchievements,
        playtime: Math.round(totalPlaytime / 60), // Convert to hours
        lastSync: new Date()
      };
    } catch (error) {
      console.error('Steam processUserData error:', error);
      throw error;
    }
  }

  /**
   * Extract Steam ID from Steam OpenID identifier
   */
  extractSteamId(identifier) {
    const match = identifier.match(/\/([0-9]{17})$/);
    return match ? match[1] : null;
  }
}

module.exports = new SteamService();