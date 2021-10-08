FROM nginx:1.21-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/nginx
RUN apk add git
RUN git clone https://github.com/Ousret/char-dataset.git
