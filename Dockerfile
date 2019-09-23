FROM nginx:1.17.3-alpine
ARG LANG="ru"

COPY default.conf                           /etc/nginx/conf.d/default.conf
COPY templates/maintenance.${LANG}.html     /usr/share/nginx/html/maintenance.html

WORKDIR /etc/nginx
EXPOSE 80
