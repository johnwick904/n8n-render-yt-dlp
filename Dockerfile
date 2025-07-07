# Download packages
RUN apt-get update && \
    apt-get install -y \
        curl \
        ffmpeg \
        fontconfig \
        wget \
        unzip \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy your font
COPY fonts/NotoSerif-CondensedBlackItalic.ttf /usr/share/fonts/truetype/custom/NotoSerif-CondensedBlackItalic.ttf

# Rebuild font cache
RUN fc-cache -f -v
