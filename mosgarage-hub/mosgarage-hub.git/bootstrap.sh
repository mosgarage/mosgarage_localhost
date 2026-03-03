#!/bin/bash
# Bootstrap the server for mosgarage-hub-srv.git

echo "Updating package lists..."
apt-get update

echo "Installing essential packages..."
apt-get install -y git curl

echo "Cloning platform repo..."
git clone https://github.com/mosgarage/mosgarage-hub.git /opt/mosgarage-hub.git
echo "Setting up environment..."
cd /opt/mosgarage-hub.git

# Copy example .env if missing
if [ ! -f .env ]; then
    cp .env.example .env
    echo "Please edit .env with your credentials"
fi

echo "Bootstrap complete. You can now run:"
echo "cd /opt/mosgarage-hub.git && docker compose up -d --build"
