# Redis - redisearch image, compatible with bitnami helm-chart

Bitnami redis helm-chart - https://github.com/bitnami/charts/tree/main/bitnami/redis/#installing-the-chart
dockerhub image - `hemantnegi/redisearch:latest`


To spin up a 3 node sentinel cluster use the below yaml as values.yaml.
```yaml
global:
  redis:
    password: ""

image:
    repository: "hemantnegi/redisearch"
    tag: 2.6.8

commonConfiguration: |-
  # Enable AOF https://redis.io/topics/persistence#append-only-file
  appendonly yes
  # Disable RDB persistence, AOF persistence already enabled.
  save ""
  
  # We will need to manually load these modules.
  loadmodule /usr/lib/redis/modules/redisearch.so
  loadmodule /usr/lib/redis/modules/rejson.so

auth:
  enabled: false
  sentinel: false

master:
  persistence:
    enabled: false

replica:
  replicaCount: 3
  persistence:
    enabled: false

sentinel:
  enabled: true
```