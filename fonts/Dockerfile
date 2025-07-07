# Use the correct Node.js version
FROM node:20-bullseye

# Install font-related tools
USER root
RUN apt-get update && apt-get install -y fontconfig

# Copy your custom font and update the font cache
COPY fonts/NotoSerif-CondensedBlackItalic.ttf /usr/share/fonts/truetype/
RUN fc-cache -f -v

# --- Add the rest of your n8n setup commands here ---
# Example for n8n:
USER node
WORKDIR /home/node
RUN npm install -g n8n
COPY . .
ENTRYPOINT [ "n8n" ]
