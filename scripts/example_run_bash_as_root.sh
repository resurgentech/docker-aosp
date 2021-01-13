#!/bin/bash

docker run -it --rm \
  --env AOSP_AS_ROOT=true \
  --volume /aosp:/aosp \
  --volume `pwd`:/workdir \
  resurgentech/aosp:latest
