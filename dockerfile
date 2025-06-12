FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    rsyslog \
    rsyslog-gnutls && \
    mkdir -p /var/spool/rsyslog /etc/rsyslog.d/certs && \
    rm -rf /var/lib/apt/lists/*

COPY rsyslog.conf /etc/rsyslog.d/server.conf
#COPY rsyslog_tls.conf /etc/rsyslog.d/server_tls.conf

COPY certs/ca.crt /etc/rsyslog.d/certs/
COPY certs/rsyslog.crt /etc/rsyslog.d/certs/
COPY certs/rsyslog.key /etc/rsyslog.d/certs/

EXPOSE 514/udp
EXPOSE 514/tcp
EXPOSE 6514/tcp

CMD ["rsyslogd", "-n"]
