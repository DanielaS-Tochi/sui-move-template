#!/usr/bin/env bash
set -e

# Use latest stable version
SUI_VERSION="mainnet-v1.37.0"
SUI_TAR="sui-${SUI_VERSION}-ubuntu-x86_64.tar.gz"
SUI_URL="https://github.com/MystenLabs/sui/releases/download/${SUI_VERSION}/${SUI_TAR}"

# Download SUI binary
echo "Downloading SUI ${SUI_VERSION}..."
wget -q $SUI_URL
wget -q "${SUI_URL}.sha256"

# Verify checksum
echo "Verifying checksum..."
sha256sum -c "${SUI_TAR}.sha256"

# Extract and install
echo "Installing SUI..."
tar xzf $SUI_TAR
sudo mv sui /usr/local/bin/
rm $SUI_TAR

# Verify installation
if ! sui --version; then
    echo "SUI installation failed"
    exit 1
fi

# Install Move analyzer and tools
echo "Installing Move tools..."
rustup component add rust-analyzer
cargo install --git https://github.com/move-language/move move-analyzer

echo "Setup completed successfully!"