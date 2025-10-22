# Dockerfile.rails
FROM ruby:3.4.7

# Default directory
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/
# Install rails
RUN gem install rails bundler
RUN bundle install

COPY . /app
