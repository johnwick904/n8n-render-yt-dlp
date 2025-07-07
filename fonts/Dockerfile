# 1. Use a modern Node.js version
FROM node:20-bullseye

# 2. Switch to root to install system packages and fonts
USER root
RUN apt-get update && apt-get install -y fontconfig

# 3. Copy font from your 'fonts' folder and update cache
COPY fonts/NotoSerif-CondensedBlackItalic.ttf /usr/share/fonts/truetype/
RUN fc-cache -f -v

# 4. Install n8n globally while still root
RUN npm install -g n8n

# 5. Switch to the non-root user for security
USER node
WORKDIR /home/node

# 6. Set the default command to start n8n
ENTRYPOINT [ "n8n" ]
