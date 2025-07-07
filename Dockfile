FROM n8nio/n8n

# Install required tools
RUN apt-get update && \
    apt-get install -y \
        curl \
        ffmpeg \
        fontconfig \
        wget \
        unzip \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy the font from Dockerfile/fonts/ to the system fonts directory
COPY Dockerfile/fonts/NotoSerif-CondensedBlackItalic.ttf /usr/share/fonts/truetype/custom/NotoSerif-CondensedBlackItalic.ttf

# Update font cache
RUN fc-cache -f -v

# Install yt-dlp
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
    -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp
