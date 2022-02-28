FROM ruby:latest

RUN apt-get update -y && apt-get install -y logrotate supervisor
RUN gem install dummer

ADD dummer.conf /

RUN mkdir -p /var/log/dummer
RUN chmod a+rwx /var/log/dummer/

ENTRYPOINT exec dummer -c /dummer.conf 
