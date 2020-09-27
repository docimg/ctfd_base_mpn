### 默认服务
mariadb: 10
php: 7.4.10
nginx: 1.18.0

### 关于ctfd动态容器
ctfd动态容器会在结尾调用docker-php-entrypoint启动容器(覆盖原dockerfile)

同时也只有在docker-php-entrypoint中才能得到环境变量中的FLAG

### 文件说明

| 文件/文件夹                  | 说明                                                       |
| ---------------------------- | ---------------------------------------------------------- |
| _files/                      | 一些配置文件                                               |
| _files/default.conf          | nginx解析php                                               |
| _files/docker-php-entrypoint | 启动系统服务，执行/config.sh和/flag.sh，重置FLAG环境变量等 |
| _files/my.cnf                | mysql配置文件，覆盖原有文件                                |
| /config.sh                   | 如果文件存在则在服务启动后调用                             |
| /flag.sh                     | 如果文件存在则在服务启动后调用                             |
| demo/                        | config.sh和flag.sh的示例代码                               |





#### 配置文件

mysql
- /etc/my.cnf

php
- /usr/local/etc/php/php.ini

nginx
- /etc/nginx/nginx.conf
- /etc/nginx/conf.d/*.conf


### 构建命令
```bash
docker build -t docimg/ctfd_base_mpn:v1.0 .
docker run -d --rm --name mpn -p 6666:80 docimg/ctfd_base_mpn:v1.0

docker push docimg/ctfd_base_mpn:v1.0
docker exec -it mpn /bin/sh

docker-compose up -d
docker-compose ps
docker-compose down
```