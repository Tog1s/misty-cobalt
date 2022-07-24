FROM tog1s/rails:2.7.6-alpine

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install --without development test

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . ./

USER 1001

ENTRYPOINT ["./entrypoint.sh"]
