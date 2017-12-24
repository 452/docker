# docker

Build eclipse
-----
```sh
cd docker/eclipse
docker build . -t eclipse
mkdir -p .eclipse-docker
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`/.eclipse-docker:/home/developer -v `pwd`:/workspace eclipse
```
