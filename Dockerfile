ARG ARCH

FROM ${ARCH}bitnami/redis:7.0.10 AS bitnami

FROM ${ARCH}redislabs/redisearch:2.6.7 as build

MAINTAINER Hemant Negi <hemant.frnz@gmail.com>

ENV BITNAMI_APP_NAME=redis
#ENV REDIS_EXTRA_FLAGS="--loadmodule /usr/lib/redis/modules/redisearch.so --loadmodule /usr/lib/redis/modules/rejson.so"

RUN mkdir -p /bitnami/redis/data
COPY --from=bitnami --chown=redis:redis /opt/bitnami/ /opt/bitnami/
RUN cp /usr/local/bin/redis-server /opt/bitnami/redis/bin/redis-server

COPY redis.conf /opt/bitnami/redis/etc/redis.conf

EXPOSE 6379/tcp
CMD ["/opt/bitnami/scripts/redis/run.sh"]
ENTRYPOINT ["/opt/bitnami/scripts/redis/entrypoint.sh"]
