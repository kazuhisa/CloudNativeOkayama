FROM ruby:2.6.2-alpine
LABEL maintainer "Kazuhisa Yamamoto <ak.hisashi@gmail.com>"

COPY Gemfile Gemfile
RUN apk add --update build-base libffi-dev
RUN bundle install
COPY search.rb search.rb
ENTRYPOINT ["bundle","exec", "ruby", "search.rb"]
