FROM ruby:2.7.1-alpine

ENV PATH /root/.yarn/bin:$PATH
ENV RACK_ENV production
ENV NODE_ENV production
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES 1

RUN apk update && apk upgrade \
 && apk add --no-cache bash git openssh build-base nodejs tzdata

RUN apk add curl bash binutils tar gnupg postgresql-dev yarn \
 && rm -rf /var/cache/apk/* \
 && apk del curl tar binutils

RUN mkdir -p /app/public/assets \
 && mkdir -p /app/tmp/pids
WORKDIR /app

COPY Gemfile* ./
RUN gem install bundler \
 && bundle config set --local without 'development' \
 && bundle install -j "$(getconf _NPROCESSORS_ONLN)" --retry 5

COPY . ./
RUN RAILS_ENV=production bundle exec rake assets:precompile
