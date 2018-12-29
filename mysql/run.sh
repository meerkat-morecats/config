mkdir conf data logs
docker build . -t $1
docker stop mymysql
docker rm mymysql
docker run -p 3306:3306 --name mymysql -v ~/mysql_config/conf:/etc/mysql/conf.d -v ~/mysql_config/logs:/logs -v ~/mysql_config/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:$1
