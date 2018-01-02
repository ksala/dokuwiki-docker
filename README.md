Simple Dockerfile for Dokuwiki, powered by Alpine Linux + nginx + PHP-FPM

This image provide a nginx instance serving DokuWiki over plain-text on port 9001.  
Remember to put a reverse proxy (another nginx instance is fine) in front of it to provide SSL, caching, rate-limiting and all that stuff!

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

# Configuration
Once the container is up you can connect to it by browsing `http://127.0.0.1:9001`  
Go to `http://127.0.0.1:9001/install.php` to finish configuring DokuWiki