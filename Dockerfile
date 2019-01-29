FROM nginx:latest

RUN apt-get update && apt-get install -y vim mc net-tools

COPY default.conf       /etc/nginx/conf.d/default.conf
COPY maintenance.html   /usr/share/nginx/html/maintenance.html

WORKDIR /etc/nginx

EXPOSE 80