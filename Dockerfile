FROM ruby
RUN gem install mdl
COPY . .
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
