# docker

Build java-swing
-----
```sh
xhost +
docker build -f java-swing/Dockerfile . -t java-swing
docker run -v /tmp/.X11-unix:/tmp/.X11-unix java-swing
```

Run imagemagick
-----
```sh
docker run -it -v $(pwd)/images:/images -v $(pwd)/converted:/converted imagemagick mogrify -path /converted -resize 60x60% -quality 60 -format png /images/*.jpg
```