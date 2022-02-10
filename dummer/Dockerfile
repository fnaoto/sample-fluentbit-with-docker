FROM ruby:latest

ADD Gemfile Gemfile
ADD dummer.conf dummer.conf

RUN bundle install
CMD bundle exec dummer -c dummer.conf
