#!/bin/bash

# Stop execution immediately if any command fails
set -e

echo -e "🚀 Starting the installation of the Modular Neovim Environment...\n"

NVIM_CONFIG="$HOME/.config/nvim"
NVIM_SHARE="$HOME/.local/share/nvim"
REPO_URL="https://github.com/thomaspalma1/nvim.git"

echo "Step 1: Checking for existing installations..."

# Safely backup existing configuration
if [ -d "$NVIM_CONFIG" ]; then
    echo "📦 Moving current configuration to ${NVIM_CONFIG}.bak..."
    mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak"
fi

if [ -d "$NVIM_SHARE" ]; then
    echo "📦 Moving current data to ${NVIM_SHARE}.bak..."
    mv "$NVIM_SHARE" "${NVIM_SHARE}.bak"
fi

echo -e "\nStep 2: Downloading the new configuration..."

# Clone the repository
git clone "$REPO_URL" "$NVIM_CONFIG"

echo -e "\n✅ Installation completed successfully!\n"
echo "Before starting, ensure you have the following dependencies installed on your system:"
echo "- Neovim 0.11.0+"
echo "- ripgrep & fd-find"
echo "- Node.js & npm"
echo "- Python3 & python3-venv"
echo -e "- LuaRocks\n"
echo "To start your new environment, simply type: nvim"
echo "(Neovim will automatically download plugins and LSP servers on the first launch)."
