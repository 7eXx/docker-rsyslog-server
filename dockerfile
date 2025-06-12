FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    rsyslog \
    rsyslog-gnutls && \
    mkdir -p /var/spool/rsyslog /etc/rsyslog.d/certs && \
    rm -rf /var/lib/apt/lists/*

COPY rsyslog.conf /etc/rsyslog.d/server.conf

COPY certs/rsyslog.crt /etc/rsyslog.d/certs/
COPY certs/rsyslog.key /etc/rsyslog.d/certs/

EXPOSE 514/udp
EXPOSE 514/tcp
EXPOSE 6514/tcp

CMD ["rsyslogd", "-n"]
