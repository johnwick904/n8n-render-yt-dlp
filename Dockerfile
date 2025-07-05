# Stage 1: Use Debian to install yt-dlp and ffmpeg
FROM debian:bullseye as downloader

RUN apt-get update && \
    apt-get install -y curl ffmpeg && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /yt-dlp && \
    chmod +x /yt-dlp

# Stage 2: Build final image based on n8n and add yt-dlp and ffmpeg
FROM n8nio/n8n:latest

# Copy yt-dlp binary
COPY --from=downloader /yt-dlp /usr/local/bin/yt-dlp

# Copy ffmpeg binary and shared libs
COPY --from=downloader /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=downloader /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
