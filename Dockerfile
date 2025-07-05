# Stage 1: Use Debian to install yt-dlp, ffmpeg, and python3
FROM debian:bullseye as downloader

RUN apt-get update && \
    apt-get install -y curl ffmpeg python3 && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /yt-dlp && \
    chmod +x /yt-dlp

# Stage 2: Use n8n image and copy tools from Debian
FROM n8nio/n8n:latest

COPY --from=downloader /yt-dlp /usr/local/bin/yt-dlp
COPY --from=downloader /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=downloader /usr/bin/python3 /usr/bin/python3
COPY --from=downloader /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
