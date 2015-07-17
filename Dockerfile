FROM ubuntu:wily

RUN apt-get update && \
  apt-get install -y prosody supervisor && \
  rm -rf /var/lib/apt/lists/* && \
  rm -vf /etc/prosody/certs/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/etc/prosody", "/var/lib/prosody", "/var/log/prosody"]

EXPOSE 5222 5269
CMD ["/usr/bin/supervisord"]

