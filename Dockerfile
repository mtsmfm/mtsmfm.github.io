FROM ruby:2.3

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

ARG APP_HOME
ENV APP_HOME $APP_HOME
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
