FROM n8nio/n8n

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl ffmpeg fontconfig && \
    rm -rf /var/lib/apt/lists/*

# Download and install the NotoSerif Condensed Black Italic font
RUN mkdir -p /usr/share/fonts/truetype/custom && \
    curl -L -o /usr/share/fonts/truetype/custom/NotoSerif-CondensedBlackItalic.ttf https://github.com/googlefonts/noto-fonts/blob/main/hinted/ttf/NotoSerif/NotoSerif-CondensedBlackItalic.ttf?raw=true && \
    fc-cache -fv
