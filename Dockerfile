FROM ruby:3.3.0-slim
ENV MATCHERS_DIR="._actionshub_problem-matchers"
ENV	MATCHER_FILE="${MATCHERS_DIR}/markdownlint.json"

COPY markdownlint.json ${MATCHER_FILE}
COPY Gemfile Gemfile.lock /
RUN bundle install \
	&& mkdir -p ${MATCHERS_DIR} \
	&& echo "::[add-matcher]${MATCHER_FILE}"

COPY --chmod=750 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
