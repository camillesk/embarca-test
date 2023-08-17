FROM ruby:2.7.0-alpine
RUN apk --update add -qq && apk add --no-cache nodejs curl tzdata libffi-dev \
    cmake gcc alpine-sdk linux-headers git zlib-dev openssl-dev gperf \
    libgcc libstdc++ libx11 glib libxrender libxext libintl postgresql-dev
RUN mkdir /embarca-test
WORKDIR /embarca-test
COPY Gemfile /embarca-test/Gemfile
COPY Gemfile.lock /embarca-test/Gemfile.lock
RUN bundle install
ENV RUBYOPT='-W:no-deprecated'
CMD ["rails", "server"]