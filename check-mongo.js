// Connect to MongoDB and check connection
const mongoose = require('mongoose');
const MONGODB_URI = 'mongodb://doadmin:HearthGate2024!@localhost:27017/admin?authSource=admin';

mongoose.connect(MONGODB_URI)
  .then(() => {
    console.log('✅ Connected to MongoDB successfully');
    mongoose.connection.close();
  })
  .catch(err => {
    console.error('❌ MongoDB connection error:', err);
  });
