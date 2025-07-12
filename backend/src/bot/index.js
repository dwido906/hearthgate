require('dotenv').config();
const { Client, GatewayIntentBits, Partials } = require('discord.js');

// Create a new client instance
const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.GuildMembers,
    GatewayIntentBits.MessageContent,
  ],
  partials: [Partials.Channel],
});

// When the client is ready, run this code (only once)
client.once('ready', () => {
  console.log(`Ready! Logged in as ${client.user.tag}`);
});

// Handle messages
client.on('messageCreate', async message => {
  // Ignore messages from bots
  if (message.author.bot) return;
  
  // Simple command handling
  if (message.content.startsWith('!hearthgate')) {
    await message.reply('Hearthgate is coming soon! 🚀');
  }
});

// Login to Discord with your token
client.login(process.env.DISCORD_TOKEN);

module.exports = client;