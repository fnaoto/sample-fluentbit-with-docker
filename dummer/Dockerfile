FROM ruby:latest

ADD dummer.conf dummer.conf

RUN gem install dummer
CMD dummer -c dummer.conf
