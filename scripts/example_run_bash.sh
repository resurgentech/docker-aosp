#!/bin/bash

docker run -it --rm \
  --env USER_ID=$(id -u) \
  --env GROUP_ID=$(id -g) \
  --volume /aosp:/aosp \
  --volume `pwd`:/workdir \
  resurgentech/aosp:latest
