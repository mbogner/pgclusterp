FROM debian:bullseye

RUN apt update \
    && apt install -y etcd net-tools iproute2 dnsutils iputils-ping \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data/etcd \
    && chown etcd:etcd /data/etcd \
    && chmod 700 /data/etcd
VOLUME /data/etcd

USER etcd
WORKDIR /var/lib/etcd

ENV CLUSTER_NAME=etcd-cluster-1

EXPOSE 2379
EXPOSE 2380

ADD ./run.sh /
CMD [ "/run.sh" ]