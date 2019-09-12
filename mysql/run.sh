#!/bin/sh
# 输入版本信息 一个参数
mkdir conf data logs
docker build . -t mysql_d1:$1
docker stop mysql_d1
docker rm mysql_d1
docker run -p 3306:3306 --name mysql_d1 -v ~/mysql_config/conf:/etc/mysql/conf.d -v ~/mysql_config/logs:/logs -v ~/mysql_config/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:$1 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
