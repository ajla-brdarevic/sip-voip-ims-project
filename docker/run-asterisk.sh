#!/bin/bash

docker run -d --name asterisk \
  -p 5060:5060/udp \
  -p 5060:5060/tcp \
  andrius/asterisk