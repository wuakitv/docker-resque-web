FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y nodejs

ADD . /resque-web-wrapper
WORKDIR /resque-web-wrapper
RUN bundle install

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]

