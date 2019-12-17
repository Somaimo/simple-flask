# Example Python Flask App Deployment with Docker

This repository is an example for running a Python Flask Application behind a nginx reverse-proxy, that handles SSL/TLS termination,
and is based on docker images / containers.

This repository is based on the following projects:
- nginx-proxy - https://github.com/jwilder/nginx-proxy
- nginx-letsencrypt-companion - https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion
- docker-compose files from Nicoals Duchon - https://github.com/buchdag/letsencrypt-nginx-proxy-companion-compose

To use the deployment option in the folder "example-deployment", you have to initalize the container for your app with the following environment variables:
- LETSENCRYPT_EMAIL: email@address.tld -- Tells the letsencrypt companion container who is responsible the domain
- LETSENCRYPT_HOST: fqdn.domain.tld -- Fully Qualified domain name under which the app is running. Used to tell letsencrypt companion container for what domain a certificate should be issued.
- VIRTUAL_HOST: fqdn.domain.tld -- Fully Qualified domain name under which the app is running. Used to configure nginx reverse proxy config. 
- VIRTUAL_PORT: '80' -- Port that the app is exposing.
