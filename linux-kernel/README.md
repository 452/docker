# docker

Build linux kernel
-----
```sh
docker build . -t kernel
```

Run
-----
```sh
qemu-system-i386 -bootp tftp://192.168.99.1//pxelinux.0 -tftp /data/pxe
```

Links
-----
```sh
http://etherboot.org/wiki/qemu
```
