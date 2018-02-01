FROM ruby:2.3

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN mkdir -p /vendor/bundle

ARG APP_HOME
ENV APP_HOME=$APP_HOME BUNDLE_PATH=/vendor/bundle
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
