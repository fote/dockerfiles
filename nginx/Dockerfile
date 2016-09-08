FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /var/log/nginx/access.log \
    && rm /var/log/nginx/error.log