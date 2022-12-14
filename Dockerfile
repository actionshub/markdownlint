FROM ruby:3.1.3-slim-bullseye

RUN gem install mdl
COPY --chmod=+x entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
