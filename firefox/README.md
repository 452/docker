# docker

Build firefox
-----
```sh
xhost +
docker rm firefox
docker build -f firefox/Dockerfile -t firefox .
docker run --name firefox -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox

```