FROM ruby:2.6

RUN apt-get update -qq && apt-get install -y nodejs

ARG GEMFILE_EXTRA_REPO_SETUP

# Create a dummy rails app
RUN gem install --no-document rails -v 5.2.4 \
 && cd / \
 && rails new resque-web \
 && cd resque-web \
 && bundle install -j 3

WORKDIR /resque-web

# Add resque-web
RUN echo "gem 'resque-web', require: 'resque_web' $GEMFILE_EXTRA_REPO_SETUP " >> Gemfile \
 && bundle install -j 3

RUN echo "Rails.application.routes.draw { mount ResqueWeb::Engine => '/' }" > config/routes.rb \
 && sed -i "s/config.log_level = :debug/config.log_level = :info/" config/environments/production.rb

COPY templates/config/initializers/resque.rb config/initializers/resque.rb

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=1
ENV RAILS_LOG_TO_STDOUT=1

RUN rails assets:precompile

CMD ["/resque-web/bin/rails", "server", "-e", "production", "-b", "0.0.0.0", "-p", "80"]