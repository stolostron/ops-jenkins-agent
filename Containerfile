from docker.io/jenkins/inbound-agent:alpine

USER root

RUN apk upgrade --no-cache
RUN apk add alpine-sdk jq libc6-compat sed coreutils gcompat
RUN ln -sfv ld-linux-x86-64.so.2 /lib/libresolv.so.2

RUN wget  http://ftp.gnu.org/gnu/make/make-4.3.tar.gz && \
    tar xvf make-4.3.tar.gz && \
    cd make-4.3 && \
    ./configure && \
    make && \
    make install && \
    cd ..;

RUN alias make='/usr/local/bin/make'
