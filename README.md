Simple Dockerfile for Dokuwiki, powered by Alpine Linux + nginx + PHP-FPM

DockerHub: https://hub.docker.com/r/ksala/dokuwiki/

NOTE: this image is not officially supported nor affiliated in any way with the DokuWiki project.

# Usage
## Docker-Compose
Enter the same directory as the `docker-compose.yml` file, and then run `docker-compose up -d` to run this  
Note: By default this container will use port 9001, change this in the yml file

## Docker
`docker run -d -p 9001:80 ksala/dokuwiki:latest \`  
`-v data:/dokuwiki/data \`  
`-v plugins:/dokuwiki/lib/plugins \`  
`-v config:/dokuwiki/config \`  
`-v templates:/dokuwiki/lib/tpl`  