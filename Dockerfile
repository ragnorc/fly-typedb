FROM vaticle/typedb:latest
RUN apt-get update && apt-get install -y \
        wget \
        bash \
        nano \
        ca-certificates \
        iptables \
        curl \
        tmux

WORKDIR /
RUN curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.7/go-cron-linux.gz | zcat > /usr/local/bin/go-cron && chmod u+x /usr/local/bin/go-cron
RUN curl -L --insecure https://github.com/DarthSim/overmind/releases/download/v2.2.2/overmind-v2.2.2-linux-amd64.gz | zcat > /usr/local/bin/overmind && chmod u+x /usr/local/bin/overmind

RUN wget -O mc https://dl.min.io/client/mc/release/linux-amd64/mc && mv mc /usr/local/bin && chmod u+x /usr/local/bin/mc

RUN wget -O tdb https://github.com/vaticle/typedb/releases/download/2.6.4/typedb-all-linux-2.6.4.tar.gz && tar -xf tdb && mv typedb-all-linux-2.6.4 typedb-all-linux

EXPOSE 1729
ADD Procfile /Procfile
ADD backup.sh /backup.sh
CMD ["overmind", "start"]
