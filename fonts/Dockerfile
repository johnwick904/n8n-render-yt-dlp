FROM n8nio/n8n:latest

# Install system dependencies and yt-dlp
USER root
RUN apk update && apk add --no-cache ffmpeg python3 py3-pip curl bash \
 && pip3 install yt-dlp \
 && apk del python3-dev build-base

USER node
