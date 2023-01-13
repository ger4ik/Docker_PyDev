# Docker_PyDev
Dockerfile for Python nvim development setup in ubuntu container

# How to use 

## Perequisites
- docker has to be Docker has to be installed

## Clone repo
<code>git clone git@github.com:ger4ik/Docker_PyDev.git</code>

## Goto directory
<code>cd Docker_PyDev</code>

## Build image
<code>docker build -t PyDev .</code>

## Generate container
<code>docker run --name pydev_container -itd PyDev</code>

## Connect to bash in container
<code>docker exec -it pydev_container zsh</code>
