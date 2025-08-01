#!/usr/bin/env bash
set -e

# Versión de SUI a instalar
SUI_VERSION="mainnet-v1.22.0"
SUI_TAR="sui-${SUI_VERSION}-ubuntu-x86_64.tar.gz"
SUI_URL="https://github.com/MystenLabs/sui/releases/download/${SUI_VERSION}/${SUI_TAR}"

# Descarga el binario
wget -q $SUI_URL

# Verifica la descarga
if [ ! -f "$SUI_TAR" ]; then
  echo "Error: No se pudo descargar $SUI_TAR"
  exit 1
fi

# Extrae el tarball
tar -xzf $SUI_TAR

# Crea ~/.local/bin si no existe
mkdir -p ~/.local/bin

# Busca y mueve el binario 'sui' a ~/.local/bin
find . -type f -name sui -exec mv {} ~/.local/bin/ \;

# Limpia archivos
rm -f $SUI_TAR

# Asegura que ~/.local/bin esté en el PATH para futuras sesiones
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.profile; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
fi

# Asegura que ~/.local/bin esté en el PATH para la sesión actual
export PATH="$HOME/.local/bin:$PATH"

# Verifica la instalación
sui --version