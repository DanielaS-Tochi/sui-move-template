#!/usr/bin/env bash
set -e

# Verificar instalación de Sui
if ! sui --version; then
    echo "Error: Sui no está instalado correctamente"
    exit 1
fi

# Configurar Sui client
sui client new-address ed25519

echo "Setup completed successfully!"