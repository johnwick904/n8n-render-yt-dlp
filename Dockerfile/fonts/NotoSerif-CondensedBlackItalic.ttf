# Base image — using Debian here
FROM debian:bullseye

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
        curl \
        ffmpeg \
        fontconfig \
        wget \
        unzip \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy the font from your repo
COPY fonts/NotoSerif-CondensedBlackItalic.ttf /usr/share/fonts/truetype/custom/NotoSerif-CondensedBlackItalic.ttf

# Update font cache
RUN fc-cache -f -v
