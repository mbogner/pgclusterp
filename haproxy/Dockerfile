FROM haproxy:bullseye

USER root
RUN apt update \
    && apt install -y net-tools iproute2 dnsutils iputils-ping \
    && rm -rf /var/lib/apt/lists/*
USER haproxy

EXPOSE 7000
EXPOSE 5000
