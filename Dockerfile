FROM nginx:alpine
ENV LANG "en"

COPY default.conf    /usr/share/nginx/template/default.conf
COPY templates/      /usr/share/nginx/html/

WORKDIR /etc/nginx
CMD ["/bin/sh", "-c", "envsubst < /usr/share/nginx/template/default.conf > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
EXPOSE 80