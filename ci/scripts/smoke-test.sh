#!/bin/bash

set -e -x

pushd jekyll-built
  bundle install
  xvfb-run -a bundle exec rspec
popd
