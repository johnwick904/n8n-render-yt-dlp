FROM n8nio/n8n:latest

USER root

# Install required packages and fonts
RUN apt-get update && \
    apt-get install -y curl ffmpeg fontconfig wget unzip && \
    mkdir -p /usr/share/fonts/truetype/custom && \
    wget -O /usr/share/fonts/truetype/custom/NotoSerif-CondensedBlackItalic.ttf \
    https://github.com/google/fonts/raw/main/ofl/notoserifcondensed/NotoSerif-CondensedBlackItalic.ttf && \
    fc-cache -f -v && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp && \
    rm -rf /var/lib/apt/lists/*

USER node
