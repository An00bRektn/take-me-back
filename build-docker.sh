#!/usr/bin/env bash

docker rm -f take-me-back
docker image rm take-me-back
docker build -t take-me-back .