# DSRP (Docker Secure Reverse Proxy)
A reverse proxy setup for docker that uses letsencrypt for ssl encryption over the https protocol

## Install
### Docker
```
curl -L https://get.docker.com | sudo bash
```
### DSRP
```
curl -L https://raw.githubusercontent.com/jamrizzi/dsrp/master/dsrp.sh | sudo bash
```

## Usage

```sh
docker run --name some-container \
    -e VIRTUAL_HOST=example.com \
    -e VIRTUAL_PORT=8080 \
    -e LETSENCRYPT_HOST=example.com \
    -e LETSENCRYPT_EMAIL=email@example.com \
    my/container:latest
```
