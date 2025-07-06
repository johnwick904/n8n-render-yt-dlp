FROM node:20-bullseye

# Install OS-level deps
RUN apt-get update && \
    apt-get install -y \
    curl ffmpeg python3 python3-pip git build-essential && \
    pip3 install yt-dlp && \
    npm install --global n8n

# Create n8n user
RUN useradd -m -s /bin/bash n8n

USER n8n
WORKDIR /home/n8n

# Expose default n8n port
EXPOSE 5678

CMD ["n8n"]
