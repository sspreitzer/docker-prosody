FROM centos:7

RUN yum install -y epel-release && \
  yum install -y prosody && \
  yum clean all

ADD assets/docker.cfg.lua /etc/prosody/conf.d/docker.cfg.lua

VOLUME /etc/prosody /var/lib/prosody /var/log/prosody

EXPOSE 5222 5269 7000

USER prosody
CMD ["/usr/bin/prosody"]
