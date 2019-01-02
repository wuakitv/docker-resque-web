FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler && gem install rails -v 5.2.0

ADD . /resque-web-wrapper
WORKDIR /resque-web-wrapper
RUN bundle install

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]

