#!/bin/bash

set -xe
for i in {1..20}; do
   curl https://ipinfo.io/ip
   sleep 5
done
