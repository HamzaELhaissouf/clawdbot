# Use Node.js 22 slim image
FROM node:22-slim

# Install git (required for Clawdbot/Moltbot dependencies)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install Clawdbot globally
RUN npm install -g clawdbot

# Create workspace directory
WORKDIR /data
RUN mkdir -p /data/workspace /data/.clawdbot

# Start the gateway and bypass the missing config block
CMD ["clawdbot", "gateway", "--bind", "0.0.0.0", "--port", "8080", "--allow-unconfigured"]
