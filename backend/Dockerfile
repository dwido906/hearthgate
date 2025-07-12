FROM node:20-alpine

WORKDIR /app

# Install dependencies with regular npm install
COPY package*.json ./
RUN npm install --production

# Copy application code
COPY . .

# Set production environment
ENV NODE_ENV=production

# Install PM2 for production process management
RUN npm install -g pm2

# Use PM2 in production mode
CMD ["pm2-runtime", "src/index.js"]
