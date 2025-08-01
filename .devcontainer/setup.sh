#!/usr/bin/env bash
set -e

# Intenta instalar desde get.sui.io
if ! curl -fsSL https://get.sui.io | bash; then
  echo "Fallo la instalación desde get.sui.io, intentando desde GitHub Releases..."

  # Define la versión que deseas instalar
  SUI_VERSION="mainnet-v1.22.0"
  SUI_TAR="sui-${SUI_VERSION}-ubuntu-x86_64.tar.gz"
  SUI_URL="https://github.com/MystenLabs/sui/releases/download/${SUI_VERSION}/${SUI_TAR}"

  # Descarga y extrae
  wget -q $SUI_URL
  tar -xzf $SUI_TAR

  # Mueve el binario a /usr/local/bin
  sudo mv sui /usr/local/bin/
  rm $SUI_TAR
fi

# Verifica la instalación
sui --version