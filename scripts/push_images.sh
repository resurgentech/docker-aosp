#!/bin/bash

## Pushes builds images locally

if [ -z $1 ] ; then
  SCRIPTNAME="$( basename "${BASH_SOURCE[0]}")"
  echo "USAGE: ${SCRIPTNAME} <REPOPROFILE>"
  echo "   - REPOPROFILE is your docker or other repo username/org"
  exit 1
fi

REPOPROFILE=$1

docker push  ${REPOPROFILE}/aosp_base:1604
docker push  ${REPOPROFILE}/aosp:1604

docker push  ${REPOPROFILE}/aosp_base:2004
docker tag ${REPOPROFILE}/aosp:2004 ${REPOPROFILE}/aosp:latest
docker push  ${REPOPROFILE}/aosp:2004
docker push  ${REPOPROFILE}/aosp:latest
