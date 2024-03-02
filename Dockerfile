# syntax = docker/dockerfile:1
ARG RUBY_VERSION=3.2.2
FROM registry.docker.com/library/ruby:$RUBY_VERSION-bullseye as dev

WORKDIR /usr/local/src

# Set as development environment
ENV RAILS_ENV="development" \
  BUNDLE_PATH="/usr/local/bundle"

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config && \
  rm -rf /var/lib/apt/lists /var/cache/apt/archives

CMD "./bin/rails-dev"