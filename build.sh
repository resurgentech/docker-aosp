#!/bin/bash

## Builds images locally

if [ -z $1 ] ; then
  SCRIPTNAME="$( basename "${BASH_SOURCE[0]}")"
  echo "USAGE: ${SCRIPTNAME} <REPOPROFILE>"
  echo "   - REPOPROFILE is your docker or other repo username/org"
  exit 1
fi

REPOPROFILE=$1

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

docker build -t ${REPOPROFILE}/aosp_base:1604 -f dockerfiles/Dockerfile.base.1604 .
docker build -t ${REPOPROFILE}/aosp:1604 -f dockerfiles/Dockerfile.1604 .

docker build -t ${REPOPROFILE}/aosp_base:2004 -f dockerfiles/Dockerfile.base.2004 .
docker build -t ${REPOPROFILE}/aosp:2004 -f dockerfiles/Dockerfile.2004 .
