# Simple maintenance page

Template: https://gist.github.com/pitch-gist/2999707

Use example:

```
# docker-compose.yml
services:
	...
    nginx-maintenance:
        build:
            context: ./
            dockerfile: Dockerfile
            args:
                # default value: "ru"
                # available values: "en", "ru"
                LANG: "en"
```

```
# main nginx.conf
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