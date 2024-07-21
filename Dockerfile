# Phase one: build
FROM node:18-bullseye-slim as builder

# Create app directory
WORKDIR /FriendConnect

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    jq \
    file \
    unzip \
    make \
    gcc \
    g++ \
    python \
    python-dev \
    libtool \
    cmake

# Set up FriendConnect
RUN git clone https://github.com/GraftMC/FriendConnect . \
    && mv test/index.js . \
    && rm .env \
    && rm -rf test \
    && sed -i 's|import { Session } from "../dist/index.js";|import { Session } from "friend-connect";|' index.js \
    && npm install

# Run Phase
FROM node:18-bookworm-slim
LABEL author="Loki" maintainer="loki@crazycoder.dev"

# Install run-time dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    iproute2 \
    git \
    sqlite3 \
    libsqlite3-dev \
    python3 \
    python3-dev \
    ca-certificates \
    dnsutils \
    tzdata \
    zip \
    tar \
    curl \
    build-essential \
    libtool \
    iputils-ping \
    libnss3 \
    tini \
    && rm -rf /var/lib/apt/lists/*

# Create a user for the application
RUN useradd -m -d /FriendConnect friendconnect && chown -R friendconnect:friendconnect /FriendConnect

# Copy FriendConnect directory from builder
COPY --from=builder /FriendConnect /FriendConnect
RUN chown -R friendconnect:friendconnect /FriendConnect

# Install global npm packages
RUN npm install npm@9.8.1 typescript ts-node @types/node --location=global

# Set user and working directory
USER friendconnect
ENV USER=friendconnect HOME=/FriendConnect
WORKDIR /FriendConnect

STOPSIGNAL SIGINT

# Set tini as entrypoint
ENTRYPOINT ["/usr/bin/tini", "-g", "--"]

# Default command
CMD ["node", "--es-module-specifier-resolution=node", "--experimental-fetch", "index.js"]
