FROM ubuntu:16.04

# install necessary packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    inform \
    curl unzip openssl ca-certificates make patch gcc libncurses5-dev \
    python3-minimal python3-pytest \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/

# install glulxe
ADD etc/ /tmp
RUN /tmp/install.sh && rm -rf /tmp/*
