FROM debian:latest

RUN apt-get -y update && apt-get install -y postfix procps rsyslog

ADD main.cf /etc/postfix/main.cf
ADD master.cf /etc/postfix/master.cf

CMD postfix -c /etc/postfix start-fg & rsyslogd -n
