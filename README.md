# pgclusterp

This project creates a local postgresql patroni cluster with a 3 node etcd cluster, 2 postgresql servers and a haproxy
instance.

| host     | ip           | description                                                       |
|----------|--------------|-------------------------------------------------------------------|
| etcd1    | 172.18.0.100 | etc cluster member                                                |
| etcd2    | 172.18.0.100 | etc cluster member                                                |
| etcd3    | 172.18.0.100 | etc cluster member                                                |
| pg1      | 172.19.0.50  | pg cluster member                                                 |
| pg2      | 172.19.0.51  | pg cluster member                                                 |
| haproxy1 | 172.20.0.150 | haproxy load balancer. Stats available via http://127.0.0.1:7000/ |

I haven't configured a VIP but for this it would require another haproxy server and a keepalived config.

## Connect to postgresql

The host haproxy1 exports port 5000 as postgresql port and maps it to 127.0.0.1 on the local machine. So simple target
your application at 127.0.0.1:5000. Default credentials are `postgres:postgres_password`.

## Quickstart

This sample only requires docker 19.03.0+.

```shell
docker compose up -d
```