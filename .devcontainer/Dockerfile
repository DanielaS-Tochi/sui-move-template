FROM mcr.microsoft.com/devcontainers/rust:1-bullseye

# Actualizar e instalar dependencias
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    wget \
    curl \
    build-essential

# Instalar Sui
RUN wget https://github.com/MystenLabs/sui/releases/download/devnet-v1.13.0/sui-devnet-v1.13.0-ubuntu-x86_64.tar.gz \
    && tar -xf sui-devnet-v1.13.0-ubuntu-x86_64.tar.gz \
    && mv sui /usr/local/bin/ \
    && rm sui-devnet-v1.13.0-ubuntu-x86_64.tar.gz

# Instalar Move
RUN cargo install --git https://github.com/move-language/move move-analyzer --branch main