FROM centos:7

ENTRYPOINT [ "/entrypoint.sh" ]

RUN yum update -y && \
  yum install -y cronie logrotate procps rsyslog

ADD entrypoint.sh /
ADD cron.d/ /etc/cron.d/
ADD logrotate.conf /etc/

RUN mkdir -p /logrotate
RUN logrotate -dv /etc/logrotate.conf

RUN chmod 0644 /etc/cron.d/cron.* && \
  crontab -u root /etc/cron.d/cron.logrotate

STOPSIGNAL SIGTERM
