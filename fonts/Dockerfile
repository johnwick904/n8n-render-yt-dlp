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

# Copy the custom font
COPY fonts/NotoSerif-CondensedBlackItalic.ttf /usr/share/fonts/truetype/custom/NotoSerif-Condensed
