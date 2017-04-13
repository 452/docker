# docker
Build linux kernel
=======
Build docker container

Run
-----
```sh
qemu-system-i386 -bootp tftp://192.168.99.1//pxelinux.0 -tftp /data/pxe
=======
Build linux kernel
-----
```sh
make clean
make menuconfig
time make -j4
```

Run
-----
```sh
qemu-system-x86_64 -kernel /tmp/docker/bzImage -initrd /tmp/docker/initrd.gz -m 512M
qemu-system-x86_64 -kernel /tmp/docker/bzImage -append "root=/dev/mmcblk0 rw rootfstype=ext4 rootwait noinitrd console=ttyS0" -sd /data/git/docker/linux-kernel/fs/rootfs.ext4 -m 512M -serial stdio
qemu-system-x86_64 -kernel /tmp/docker/bzImage -append "root=/dev/sda rw rootfstype=ext4 noinitrd debug console=ttyS0 init=/bin/busybox sh /etc/inittab" -drive format=raw,file=/git/docker/linux-kernel/fs/rootfs.ext4 -m 512M -serial stdio
qemu-system-i386 -bootp tftp://192.168.99.1//pxelinux.0 -tftp /data/pxe
qemu-system-x86_64 -bootp tftp://192.168.99.1//pxelinux.0 -tftp /data/pxe


/data/git/docker/linux-kernel/fs/fs.sh; qemu-system-x86_64 -kernel /tmp/docker/bzImage -append "root=/dev/sda rw rootfstype=ext4 noinitrd debug console=ttyS0 init=/bin/busybox sh /etc/inittab" -drive format=raw,file=/git/docker/linux-kernel/fs/rootfs.ext4 -m 512M -serial stdio
```

Custom init program
-----
```sh
cat > hello.c << EOF
#include <stdio.h>
#include <unistd.h>
int main(int argc, char *argv[])
{
  printf("Hello world!\n");
  sleep(999999999);
}
EOF
gcc -static hello.c -o init
```

Useful commands
-----
```sh
file
readelf -d

Links
-----
http://etherboot.org/wiki/qemu
https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
http://mgalgs.github.io/2015/05/16/how-to-build-a-custom-linux-kernel-for-qemu-2015-edition.html
http://www.kaizou.org/2016/09/boot-minimal-linux-qemu
