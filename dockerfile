FROM debian:12

RUN apt-get update && apt-get install -y \
    rsyslog \
    rsyslog-gnutls \
    rsyslog-openssl && \
    mkdir -p /var/spool/rsyslog && \
    rm -rf /var/lib/apt/lists/*

COPY rsyslog.conf /etc/rsyslog.d/server.conf
EXPOSE 514/udp
EXPOSE 514/tcp

CMD ["rsyslogd", "-n"]
