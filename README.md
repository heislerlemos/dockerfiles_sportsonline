# SPORTSONLINE


### Clone repository to your localhost
```bash
git clone https://github.com/heislerlemos/dockerfiles_sportsonline.git
```

## How to Use

Requirements: 

Install Docker Engine " https://www.docker.com/products/docker-desktop/ "
Optional - Install Github Desktop for easily maintain repository clones " https://desktop.github.com/ "

NOTE: Create user account accordingly ...

## Build image

Use docker-compose to build image and create a containers automatically "python and ubuntu images"
```
docker-compose up -d
```

# Execute Docker containers

## Ubuntu image
```bash
docker exec -it dockerfiles_sportsonline-container-1 /bin/bash
```





# ===== REFERENCE ====

## Para correr o docker 
```bash
sudo docker run -p 1000:3000 sportsonline:v1 
```
```
sudo docker build . -t sportsonline:v1
```
### e aceda na no url 0.0.0.0:1000 



### stop container
```bash
docker-compose stop
```

### Destroy container
```bash
docker-compose down
```

