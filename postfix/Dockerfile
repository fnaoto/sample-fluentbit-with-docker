FROM debian:latest

RUN apt-get -y update && apt-get install -y postfix procps rsyslog

ADD main.cf /etc/postfix/main.cf
ADD master.cf /etc/postfix/master.cf
ADD rsyslog.conf /etc/rsyslog.conf

CMD rsyslogd -n & postfix -c /etc/postfix start-fg
