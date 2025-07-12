// Gatescore calculation service
// Weighted scoring system for gaming platform integration

const PLATFORM_WEIGHTS = {
  discord: 0.15,  // 15% - community engagement
  steam: 0.25,    // 25% - game library depth
  epic: 0.15,     // 15% - Epic ecosystem
  riot: 0.25,     // 25% - competitive performance
  twitch: 0.20    // 20% - content creation
};

const MAX_SCORE_PER_PLATFORM = 1000;

/**
 * Calculate Discord score based on community engagement
 */
function calculateDiscordScore(discordData) {
  if (!discordData || !discordData.connected) return 0;

  let score = 0;
  const { data } = discordData;

  // Base score for having Discord
  score += 100;

  // Server count bonus (max 300 points)
  if (data.guilds) {
    score += Math.min(data.guilds.length * 10, 300);
  }

  // Nitro bonus (200 points)
  if (data.nitro) {
    score += 200;
  }

  // Account age bonus (max 200 points)
  if (data.id) {
    const discordEpoch = 1420070400000; // Discord epoch
    const accountCreation = parseInt(data.id) / 4194304 + discordEpoch;
    const ageInDays = (Date.now() - accountCreation) / (1000 * 60 * 60 * 24);
    score += Math.min(ageInDays / 10, 200);
  }

  // Profile completeness (max 200 points)
  if (data.avatar) score += 100;
  if (data.username && data.discriminator) score += 100;

  return Math.min(score, MAX_SCORE_PER_PLATFORM);
}

/**
 * Calculate Steam score based on game library and achievements
 */
function calculateSteamScore(steamData) {
  if (!steamData || !steamData.connected) return 0;

  let score = 0;
  const { data } = steamData;

  // Base score for having Steam
  score += 100;

  // Game library size (max 400 points)
  if (data.games) {
    score += Math.min(data.games.length * 5, 400);
  }

  // Total playtime bonus (max 300 points)
  if (data.playtime) {
    score += Math.min(data.playtime / 100, 300); // 1 point per 100 hours
  }

  // Achievement completion rate (max 200 points)
  if (data.achievements && data.games) {
    const totalAchievements = data.achievements.length;
    const avgAchievementsPerGame = totalAchievements / data.games.length;
    score += Math.min(avgAchievementsPerGame * 10, 200);
  }

  return Math.min(score, MAX_SCORE_PER_PLATFORM);
}

/**
 * Calculate Epic Games score
 */
function calculateEpicScore(epicData) {
  if (!epicData || !epicData.connected) return 0;

  let score = 0;
  const { data } = epicData;

  // Base score for having Epic
  score += 100;

  // Game library (max 300 points)
  if (data.games) {
    score += Math.min(data.games.length * 15, 300);
  }

  // Fortnite stats bonus (max 400 points)
  if (data.stats && data.stats.fortnite) {
    const { wins, kills, matches } = data.stats.fortnite;
    if (wins) score += Math.min(wins * 5, 200);
    if (kills && matches) {
      const kd = kills / Math.max(matches - wins, 1);
      score += Math.min(kd * 50, 200);
    }
  }

  // Account completeness (max 200 points)
  if (data.displayName) score += 100;
  if (data.accountId) score += 100;

  return Math.min(score, MAX_SCORE_PER_PLATFORM);
}

/**
 * Calculate Riot Games score based on competitive performance
 */
function calculateRiotScore(riotData) {
  if (!riotData || !riotData.connected) return 0;

  let score = 0;
  const { data } = riotData;

  // Base score for having Riot account
  score += 100;

  // Competitive ranks bonus (max 500 points)
  if (data.ranks) {
    Object.keys(data.ranks).forEach(game => {
      const rank = data.ranks[game];
      if (rank.tier) {
        const tierValues = {
          'IRON': 50, 'BRONZE': 100, 'SILVER': 150,
          'GOLD': 200, 'PLATINUM': 250, 'DIAMOND': 300,
          'MASTER': 350, 'GRANDMASTER': 400, 'CHALLENGER': 450
        };
        score += tierValues[rank.tier.toUpperCase()] || 0;
      }
    });
  }

  // Match history performance (max 300 points)
  if (data.matchHistory) {
    const recentMatches = data.matchHistory.slice(0, 20);
    const winRate = recentMatches.filter(match => match.win).length / recentMatches.length;
    score += winRate * 300;
  }

  // Account completeness (max 100 points)
  if (data.gameName && data.tagLine) score += 100;

  return Math.min(score, MAX_SCORE_PER_PLATFORM);
}

/**
 * Calculate Twitch score based on streaming activity
 */
function calculateTwitchScore(twitchData) {
  if (!twitchData || !twitchData.connected) return 0;

  let score = 0;
  const { data } = twitchData;

  // Base score for having Twitch
  score += 100;

  // Follower count bonus (max 400 points)
  if (data.followerCount) {
    score += Math.min(data.followerCount / 10, 400);
  }

  // Streaming consistency (max 300 points)
  if (data.streamStats) {
    const { totalStreams, avgViewers, hoursStreamed } = data.streamStats;
    if (totalStreams) score += Math.min(totalStreams * 2, 150);
    if (avgViewers) score += Math.min(avgViewers * 5, 150);
  }

  // Profile completeness (max 200 points)
  if (data.displayName) score += 100;
  if (data.login) score += 100;

  return Math.min(score, MAX_SCORE_PER_PLATFORM);
}

/**
 * Calculate overall Gatescore for a user
 */
function calculateGatescore(user) {
  const platforms = user.platforms || {};
  
  const platformScores = {
    discord: calculateDiscordScore(platforms.discord),
    steam: calculateSteamScore(platforms.steam),
    epic: calculateEpicScore(platforms.epic),
    riot: calculateRiotScore(platforms.riot),
    twitch: calculateTwitchScore(platforms.twitch)
  };

  // Calculate weighted overall score
  const overallScore = Object.keys(platformScores).reduce((total, platform) => {
    return total + (platformScores[platform] * PLATFORM_WEIGHTS[platform]);
  }, 0);

  return {
    overall: Math.round(overallScore),
    breakdown: platformScores,
    lastCalculated: new Date()
  };
}

/**
 * Update user's Gatescore in database
 */
async function updateUserGatescore(user) {
  const gatescore = calculateGatescore(user);
  user.gatescore = gatescore;
  await user.save();
  return gatescore;
}

module.exports = {
  calculateGatescore,
  updateUserGatescore,
  calculateDiscordScore,
  calculateSteamScore,
  calculateEpicScore,
  calculateRiotScore,
  calculateTwitchScore,
  PLATFORM_WEIGHTS,
  MAX_SCORE_PER_PLATFORM
};