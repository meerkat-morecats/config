#!/bin/sh
mkdir data
docker build . -t
docker run -p 6379:6379 -v $PWD/data:/data  -d redis:3.2 redis-server --appendonly yes
