#!/bin/bash

set -e -x

pushd engineerbetter.com
  bundle install --path ../gem-cache
  bundle exec jekyll build
  pushd _site
  tar -czf ../../jekyll-built/engineerbetter-blog-built.tar.gz .
  cp -r * ../../generated-blog
popd
