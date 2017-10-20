FROM ruby
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /lab02
WORKDIR /lab02
ADD Gemfile /lab02/Gemfile
ADD Gemfile.lock /lab02/Gemfile.lock
RUN bundle install
ADD . /lab02