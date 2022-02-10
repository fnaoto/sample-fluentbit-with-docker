FROM debian:latest

RUN apt-get -y update && apt-get install -y postfix procps rsyslog

ADD main.cf /etc/postfix/main.cf
ADD master.cf /etc/postfix/master.cf

CMD [ "/bin/sh", "-c", "postfix -c /etc/postfix start-fg & /usr/sbin/rsyslogd -n" ]
