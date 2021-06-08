FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -Scc --noconfirm

RUN pacman -Sy --noconfirm make cmake git clang
RUN pacman -Sy --noconfirm base-devel

RUN git clone https://github.com/obgm/libcoap /src/libcoap
WORKDIR /src/libcoap
RUN ./autogen.sh
RUN ./configure --disable-doxygen --disable-manpages --with-openssl
RUN make
RUN sudo make install

WORKDIR /src
COPY . ./

RUN gcc main.c -o coap-client -g -lcoap-3-openssl -lcrypto -lpthread -lrt -ldl

#ENTRYPOINT [ "/bin/bash" ]
ENTRYPOINT [ "/src/run.sh" ]
