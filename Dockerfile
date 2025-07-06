FROM node:20-bullseye

WORKDIR /app

# Install dependencies first
RUN apt-get update && \
    apt-get install -y \
      curl \
      ffmpeg \
      fontconfig \
      wget \
      unzip \
      ca-certificates

# Download font separately to avoid breaking the entire layer
RUN mkdir -p /usr/share/fonts/truetype/custom && \
    wget -O /usr/share/fonts/truetype/custom/NotoSerif-CondensedBlackItalic.ttf \
    https://github.com/google/fonts/raw/main/ofl/notoserifcondensed/NotoSerif-CondensedBlackItalic.ttf

# Rebuild font cache
RUN fc-cache -f -v

# Install yt-dlp
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
    -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# Install n8n
RUN npm install -g n8n

# Clean up
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 5678

CMD ["n8n"]
