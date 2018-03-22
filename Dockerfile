FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential
# For postgres
RUN apt-get install -y libpq-dev
# For nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev
# For JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /app/preserve

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install --jobs=4

ADD . $APP_HOME
