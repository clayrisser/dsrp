#!/bin/bash

docker run -d --name nginx --restart=always -p 80:80 -p 443:443 \
       --name nginx-proxy \
       -v /volumes/certs:/etc/nginx/certs:ro \
       -v /etc/nginx/vhost.d \
       -v /usr/share/nginx/html \
       -v /var/run/docker.sock:/tmp/docker.sock:ro \
       jwilder/nginx-proxy
docker run -d --name letsencrypt --restart=unless-stopped \
       -v /volumes/certs:/etc/nginx/certs:rw \
       --volumes-from nginx-proxy \
       -v /var/run/docker.sock:/var/run/docker.sock:ro \
       alastaircoote/docker-letsencrypt-nginx-proxy-companion:latest
