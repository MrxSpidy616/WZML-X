FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# ✅ install system dependencies first
RUN apt-get update && apt-get install -y \
    mediainfo \
    libmediainfo-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# ✅ modern build tools
RUN pip3 install --upgrade pip setuptools wheel

# ✅ force modern build system
RUN pip3 install --no-cache-dir --use-pep517 -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
