FROM ubuntu:25.04

ARG BUG

RUN apt-get update && apt-get install -y git make autoconf automake libtool cmake nasm \
        zlib1g-dev liblzma-dev libjpeg-turbo8-dev wget g++

RUN git clone https://gitlab.com/libtiff/libtiff.git /work
WORKDIR /work
RUN git checkout 651b14ffa91722bd1815e367c8e7708925057430

COPY setup.patch* /work/
RUN if [ -f setup.patch ]; then git apply setup.patch; fi

COPY ${BUG}/${BUG}.patch ${BUG}.patch
RUN git apply ${BUG}.patch

RUN ./autogen.sh && \
    ./configure --disable-shared
RUN make -j$(nproc) clean && \
    make -j$(nproc) && \
    make install

COPY ${BUG}/*_${BUG}.* /test/crash
WORKDIR /