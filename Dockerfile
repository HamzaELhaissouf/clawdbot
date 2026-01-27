# Use the official Node.js 22 image
FROM node:22-slim

# Install Clawdbot globally
RUN npm install -g clawdbot

# Create a workspace directory
WORKDIR /data
RUN mkdir -p /data/workspace /data/.clawdbot

# Set the entry point to run the gateway
# We force it to bind to 0.0.0.0 so Railway can find it
CMD ["clawdbot", "gateway", "--bind", "0.0.0.0", "--port", "8080"]
