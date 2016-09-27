FROM ruby:2.3

RUN apt-get update

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install --jobs 8

COPY . $APP_HOME

ENV PORT 3011
EXPOSE 3011

CMD rackup -s puma -o 0.0.0.0 -p $PORT
