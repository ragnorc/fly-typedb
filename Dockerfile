FROM alpine:latest
RUN apk add --no-cache \
        wget \
        openjdk11 \
        bash \
        nano \
        supervisor \
        ca-certificates \
        iptables \
        gcompat \
        curl

COPY typedb-all-linux /typedb-all-linux
RUN rm -r /typedb-all-linux/server/data/lost+found || true
EXPOSE 1729
ADD supervisord.conf /etc/supervisor
CMD ["/typedb-all-linux/typedb", "server"]
