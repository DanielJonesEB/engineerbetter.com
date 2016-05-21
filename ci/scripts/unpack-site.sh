#!/bin/bash

set -e -x

pushd engineerbetter-built
  tar -zxf engineerbetter-jekyll-built.tar.gz -C ../jekyll-built/
popd
