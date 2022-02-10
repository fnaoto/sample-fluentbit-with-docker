FROM debian:latest

RUN apt-get -y update && apt-get install -y postfix procps

ADD main.cf /etc/postfix/main.cf
ADD master.cf /etc/postfix/master.cf

CMD [ "/usr/sbin/postfix", "-c", "/etc/postfix", "start-fg" ]
