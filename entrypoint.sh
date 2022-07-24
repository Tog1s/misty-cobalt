#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

cd /app

bundle exec rake db:migrate

if [[ $? != 0 ]]; then
  echo
  echo "** Failed to migrate. Running setup first."
  echo
  bundle exec rake db:setup && \
  bundle exec rake db:migrate
fi

# Generate rails secret key
export SECRET_KEY_BASE=$(rails secret)

# Precompile assets before run server
bundle exec rake assets:precompile
bundle exec rails server -b 0.0.0.0
