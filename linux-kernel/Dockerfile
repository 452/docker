FROM ubuntu
MAINTAINER Ihor <sp.titan@gmail.com>
# Install dependencies
RUN apt update                   \
 && apt -y -q upgrade            \
 && apt -y -q install            \
 libncurses5-dev                 \
 gcc                             \
 make                            \
 git                             \
 exuberant-ctags                 \
 bc                              \
 libssl-dev                      \
 && apt clean
# https://hub.docker.com/r/moul/kernel-builder/~/dockerfile/
# https://kernelnewbies.org/KernelBuild

WORKDIR /sources
RUN git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
WORKDIR /sources/linux-stable
RUN git checkout -b stable v4.10.10
RUN make defconfig
RUN make -j4
