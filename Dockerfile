FROM python:3.12-slim

WORKDIR /app
COPY . /app/

# Install git, required C++ compilers/headers, and FFmpeg binary
# Then upgrade pip, install python dependencies, and clean up build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    gcc \
    python3-dev \
    zlib1g-dev \
    libjpeg-dev \
    ffmpeg \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && apt-get purge -y --auto-remove git gcc python3-dev \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
CMD ["python", "bot.py"]
