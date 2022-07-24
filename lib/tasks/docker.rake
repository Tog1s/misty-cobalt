# frozen_string_literal: true

image = '<your repo name>/misty-cobalt'
tag = 'v1.0.3'

namespace :docker do
  desc 'Build docker image'
  task :build do
    system "docker build -t #{image}:#{tag} ."
  end

  desc 'Push docker image to registry'
  task :push do
    system "docker push #{image}:#{tag}"
  end
end
