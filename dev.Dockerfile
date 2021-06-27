FROM ruby:2.7.1-alpine

ENV RACK_ENV development
ENV NODE_ENV development
ENV RAILS_ENV development

RUN apk update && apk upgrade \
 && apk add --no-cache bash git openssh build-base nodejs tzdata

RUN apk add curl bash binutils tar gnupg postgresql-dev yarn \
 && rm -rf /var/cache/apk/* \
 && apk del curl tar binutils

RUN mkdir -p /app/public/assets
WORKDIR /app

COPY Gemfile* ./
RUN gem install bundler && bundle install --jobs=4
