FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y \
        software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y \
        openjdk-11-jre-headless \
        bash \
        nano \
        supervisor \
        curl && \
    rm -rf /var/lib/apt/lists && \
    apt-get -y install --only-upgrade libstdc++6 

COPY typedb-all-linux /typedb-all-linux
RUN rm -r /typedb-all-linux/server/data/lost+found || true
EXPOSE 1729
ADD supervisord.conf /etc/supervisor
CMD ["/typedb-all-linux/typedb", "server"]
