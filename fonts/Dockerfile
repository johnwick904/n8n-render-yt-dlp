# Use an Alpine-based image with Python
FROM python:3.11-alpine

# Set environment
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apk update && apk add --no-cache \
    ffmpeg \
    gcc \
    musl-dev \
    python3-dev \
    py3-pip \
    curl \
    bash

# Install yt-dlp
RUN pip install yt-dlp

# Optional: Copy your project files
COPY . /app
WORKDIR /app

# Default command (can be replaced by Render)
CMD ["bash"]
