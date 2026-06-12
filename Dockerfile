FROM python:3.12-slim

WORKDIR /app
COPY . /app/

# Install git, upgrade pip, install requirements, and then clean up git and cache
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && apt-get purge -y --auto-remove git \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
CMD ["python", "bot.py"]
