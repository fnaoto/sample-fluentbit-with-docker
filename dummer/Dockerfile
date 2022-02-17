FROM ruby:latest

ENV DUMMER_CONFIG_PATH file.conf
RUN apt-get update -y && apt-get install -y logrotate supervisor
RUN gem install dummer

ADD *.conf *.sh /
RUN logrotate -dv /logrotate.conf

RUN mkdir -p /var/log/dummer
RUN chmod a+rwx /var/log/dummer/

ENTRYPOINT [ "/entrypoint.sh" ]
