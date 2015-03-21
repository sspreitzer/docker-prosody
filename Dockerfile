FROM ubuntu:trusty

ADD prosody.list /etc/apt/sources.list.d/
ADD prosody.key /

RUN apt-key add /prosody.key
RUN apt-get update && apt-get install -y prosody supervisor
RUN rm -vf /etc/prosody/certs/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME /etc/prosody
VOLUME /var/log/prosody

EXPOSE 5222 5269
CMD ["/usr/bin/supervisord"]

