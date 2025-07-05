FROM n8nio/n8n

# Install yt-dlp and ffmpeg
RUN apt-get update && \
    apt-get install -y curl ffmpeg && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp
