FROM nginx:1.20.2-alpine

RUN apk add --no-cache shadow
RUN usermod -u 1001 nginx \
	&& groupmod -g 1001 nginx \
        && chown -R nginx:nginx /var/cache/nginx \
        && chown -R nginx:nginx /var/log/nginx \
        && touch /var/run/nginx.pid && chown -R nginx:nginx /var/run/nginx.pid \
        && sed -i '/^user[[:space:]]*nginx;$/d' /etc/nginx/nginx.conf

WORKDIR /app/
COPY ./app .

COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8000
USER 1001:1001
CMD ["nginx", "-g", "daemon off;"]
