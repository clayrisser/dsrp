#!/bin/bash

docker run -d --name nginx --restart=always -p 80:80 -p 443:443 \
       --name nginx-proxy \
       -v /volumes/certs:/etc/nginx/certs \
       -v /etc/nginx/vhost.d \
       -v /usr/share/nginx/html \
       -v /var/run/docker.sock:/tmp/docker.sock \
       jwilder/nginx-proxy
docker run -d --name letsencrypt --restart=unless-stopped \
       -v /volumes/certs:/etc/nginx/certs \
       --volumes-from nginx-proxy \
       -v /var/run/docker.sock:/var/run/docker.sock \
       jrcs/letsencrypt-nginx-proxy-companion:latest
