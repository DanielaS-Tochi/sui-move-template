FROM mcr.microsoft.com/devcontainers/rust:1-bullseye

# Instalar dependencias necesarias
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    wget \
    curl \
    build-essential

# Variables de entorno
ENV SUI_VERSION="mainnet-v1.37.0"
ENV SUI_TAR="sui-${SUI_VERSION}-ubuntu-x86_64.tar.gz"
ENV SUI_URL="https://github.com/MystenLabs/sui/releases/download/${SUI_VERSION}/${SUI_TAR}"

# Instalar Sui
RUN wget $SUI_URL \
    && tar -xvf $SUI_TAR \
    && mv sui /usr/local/bin/ \
    && rm $SUI_TAR

# Instalar Move analyzer
RUN rustup component add rust-analyzer