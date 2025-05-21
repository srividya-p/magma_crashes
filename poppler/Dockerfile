FROM ubuntu:25.04

ARG BUG
ARG CRASHFILE

RUN apt-get update && apt-get install -y \
    git make cmake g++ autoconf automake libtool pkg-config \
    zlib1g-dev libjpeg-dev libopenjp2-7-dev \
    libpng-dev libpixman-1-dev libtiff-dev liblcms2-dev \
    libcairo2-dev libboost-dev libfreetype6

RUN git clone --no-checkout https://gitlab.freedesktop.org/poppler/poppler.git /work
WORKDIR /work
RUN git checkout 221914fb062253b879c9fbf5a58e89330e679313

COPY ${BUG}/${BUG}.patch ${BUG}.patch
RUN git apply ${BUG}.patch

ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

RUN cmake \
  -DBUILD_SHARED_LIBS=OFF \
  -DFONT_CONFIGURATION=generic \
  -DBUILD_GTK_TESTS=OFF \
  -DBUILD_QT5_TESTS=OFF \
  -DBUILD_CPP_TESTS=OFF \
  -DENABLE_LIBPNG=ON \
  -DENABLE_LIBTIFF=ON \
  -DENABLE_LIBJPEG=ON \
  -DENABLE_BOOST=ON \
  -DWITH_Cairo=ON \
  -DENABLE_UTILS=ON \
  -DENABLE_LIBCURL=OFF \
  -DENABLE_GLIB=OFF \
  -DENABLE_GOBJECT_INTROSPECTION=OFF \
  -DENABLE_QT5=OFF \
  -DENABLE_QT6=OFF \
  -DENABLE_NSS3=OFF \
  -DENABLE_GPGME=OFF 
RUN make -j$(nproc) poppler poppler-cpp pdfimages pdftoppm
RUN make install

WORKDIR /
RUN rm -rf /work

COPY ${BUG}/*_${BUG}.* ${CRASHFILE}
