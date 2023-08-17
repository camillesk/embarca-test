FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /embarca-test
WORKDIR /embarca-test
COPY Gemfile /embarca-test/Gemfile
COPY Gemfile.lock /embarca-test/Gemfile.lock
RUN bundle install
CMD ["rails", "server"]