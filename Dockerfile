FROM node:20-bullseye

WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
        curl \
        ffmpeg \
        fontconfig \
        wget \
        unzip \
        ca-certificates && \
    mkdir -p /usr/share/fonts/truetype/custom && \
    wget -O /usr/share/fonts/truetype/custom/NotoSerif-CondensedBlackItalic.ttf \
        https://github.com/google/fonts/raw/main/ofl/notoserifcondensed/NotoSerif-CondensedBlackItalic.ttf && \
    fc-cache -f -v && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
        -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp && \
    npm install -g n8n && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 5678

CMD ["n8n"]
