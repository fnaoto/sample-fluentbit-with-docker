FROM ruby:latest

ENV DUMMER_CONFIG_PATH file.conf
ADD *.conf ./

RUN mkdir -p /var/log/dummer
RUN chmod a+rwx /var/log/dummer/
RUN gem install dummer
CMD dummer -c ${DUMMER_CONFIG_PATH}
