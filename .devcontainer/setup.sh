#!/usr/bin/env bash
set -e

# Versión de SUI a instalar
SUI_VERSION="mainnet-v1.22.0"
SUI_TAR="sui-${SUI_VERSION}-ubuntu-x86_64.tar.gz"
SUI_URL="https://github.com/MystenLabs/sui/releases/download/${SUI_VERSION}/${SUI_TAR}"

# Descarga y extrae el binario
wget -q $SUI_URL
tar -xzf $SUI_TAR

# Mueve el binario a /usr/local/bin (requiere permisos de superusuario)
sudo mv sui /usr/local/bin/
rm $SUI_TAR

# Verifica la instalación
sui --version