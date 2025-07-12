require('mongoose').connect(
  "mongodb://doadmin:3b5f219NBK78eF0Z@159.89.120.107:27017/admin?tls=true&authSource=admin&replicaSet=db-mongodb-nyc1-28094"
).then(() => {
  console.log('MongoDB connection successful!');
  process.exit(0);
}).catch(err => {
  console.error('MongoDB connection failed:', err);
  process.exit(1);
});
