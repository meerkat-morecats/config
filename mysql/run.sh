mkdir conf data logs
docker build . -t $1
docker stop mymysql
docker rm mymysql
docker run -p 3306:3306 --name mymysql -v ~/mysql_config/conf:/etc/mysql/conf.d -v ~/mysql_config/logs:/logs -v ~/mysql_config/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:$1 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
