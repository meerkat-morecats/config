#!/bin/sh
# 输入版本信息 一个参数
mkdir data
chmod 777 data
docker build . -t myredis:$1
docker stop myredis
docker rm myredis
docker run -p 6379:6379 -v $PWD/data:/data  -d redis:3.2 redis-server --appendonly yes

