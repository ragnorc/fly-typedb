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
        curl \
        tmux

RUN curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.7/go-cron-linux.gz | zcat > /usr/local/bin/go-cron && chmod u+x /usr/local/bin/go-cron
RUN curl -L --insecure https://github.com/DarthSim/overmind/releases/download/v2.2.2/overmind-v2.2.2-linux-amd64.gz | zcat > /usr/local/bin/overmind && chmod u+x /usr/local/bin/overmind

RUN wget -O mc https://dl.min.io/client/mc/release/linux-amd64/mc && mv mc /usr/local/bin && chmod u+x /usr/local/bin/mc


COPY typedb-all-linux /typedb-all-linux
RUN rm -r /typedb-all-linux/server/data/lost+found || true
EXPOSE 1729
ADD Procfile /Procfile
ADD backup.sh /backup.sh

CMD ["overmind", "start"]
