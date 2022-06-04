FROM postgres:14

RUN apt update \
    && apt install -y python3-pip python3-dev libpq-dev net-tools iproute2 dnsutils iputils-ping \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip \
    && pip install patroni \
    && pip install python-etcd \
    && pip install psycopg2

RUN ln -s /usr/lib/postgresql/14/bin/* /usr/sbin/

EXPOSE 5432
EXPOSE 8008

USER postgres
WORKDIR /var/lib/postgresql
VOLUME /var/lib/postgresql/data
ADD patroni_template.yml /var/lib/postgresql

ADD ./run.sh /
CMD [ "/run.sh" ]
