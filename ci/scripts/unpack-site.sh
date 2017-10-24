#!/bin/bash

set -e -x

pushd engineerbetter-built
  tar -zxf engineerbetter-blog-built.tar.gz -C ../jekyll-built/
popd
