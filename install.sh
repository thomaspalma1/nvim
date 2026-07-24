#!/bin/bash

# Stop execution immediately if any command fails
set -e

echo -e "🚀 Starting the installation of the Neovim Environment...\n"

# 1. Dependency check (Fail fast before touching any files)
echo "Step 1: Checking required commands..."

check_command() {
    local cmd="$1"

    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "❌ Error: '$cmd' is not installed or not in PATH."
        echo "Please install it and run this script again."
        exit 1
    fi

    echo "✔ Found $cmd at $(command -v "$cmd")"
}

check_command git
check_command nvim


NVIM_CONFIG="$HOME/.config/nvim"
NVIM_SHARE="$HOME/.local/share/nvim"
REPO_URL="https://github.com/thomaspalma1/nvim.git"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)


echo -e "\nStep 2: Downloading the new configuration..."

# 2. Safe Cloning (Clone to a temporary directory first)
TMP_DIR=$(mktemp -d)

cleanup() {
    if [ -d "$TMP_DIR" ]; then
        rm -rf "$TMP_DIR"
    fi
}

trap cleanup EXIT

echo "Cloning repository..."

git clone "$REPO_URL" "$TMP_DIR"


echo -e "\nStep 3: Backing up existing installations..."

# 3. Timestamped backups
if [ -d "$NVIM_CONFIG" ]; then
    BACKUP_CONFIG="${NVIM_CONFIG}.bak.${TIMESTAMP}"
    echo "📦 Moving current configuration to ${BACKUP_CONFIG}..."
    mv "$NVIM_CONFIG" "$BACKUP_CONFIG"
fi


if [ -d "$NVIM_SHARE" ]; then
    BACKUP_SHARE="${NVIM_SHARE}.bak.${TIMESTAMP}"
    echo "📦 Moving current data to ${BACKUP_SHARE}..."
    mv "$NVIM_SHARE" "$BACKUP_SHARE"
fi


echo -e "\nStep 4: Applying new configuration..."

# Ensure parent directories exist
mkdir -p "$(dirname "$NVIM_CONFIG")"

# Move new configuration
mv "$TMP_DIR" "$NVIM_CONFIG"


echo -e "\n✅ Installation completed successfully!"
echo "Neovim configuration installed at:"
echo "$NVIM_CONFIG"
