imdock-nginx
====================================================

## What's this:

  * you can easy install Nginx Web Service

#### change your custom settting (container_name: {project-name})

    ~/{project-name}/imdock-nginx $ vim ./docker-compose-yml
    ~/{project-name}/imdock-nginx $ docker-compose up


#### setting your custom nginx config (volumes: ./website:/var/www → ../{project-dir}:/var/www)

    ~/{project-name}/imdock-nginx $ vim ./docker-compose-yml
    ~/{project-name}/imdock-nginx $ vim ./etc/nginx/default.conf
    ~/{project-name}/imdock-nginx $ docker-compose up -d


## Reference architecture:

```txt
imdock-nginx
├── etc/nginx/default.conf   # nginx website setting
├── src                      # website files
└── docker-compose.yml
```

## How to and other docker-compose use the same network :

    #if you not have group network, you can create this, and other docker-compose use this network setting
    ~ $ docker network create --driver bridge imdockgroup

## How to change setting:

  * You just look at this directory you will understand (cnp7/config/*)

  * When the settings are complete, restart the container
