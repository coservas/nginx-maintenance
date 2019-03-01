# Simple maintenance page

Template: https://gist.github.com/pitch-gist/2999707

Use example:

```
# docker-compose.yml
services:
	...
    nginx-maintenance:
        build: nginx-maintenance
        restart: always
        environment:
            # default value: "en"
            # available values: "en", "ru"
            LANG: "ru"
        # this line should be if use environment LANG
        # + you need "docker-compose down" before changes
        command: /bin/sh -c "envsubst < /usr/share/nginx/template/default.conf > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
```

```
# nginx.conf
upstream backend {
    server ...;
    server nginx-maintenance:80 backup;
}

server {
    listen 80;
	...
    location / {
        proxy_pass http://backend;
        proxy_connect_timeout 1s;
    }
}
```