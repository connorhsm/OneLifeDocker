FROM buildpack-deps:latest AS build

ADD ./docker/2hol/fetch-and-compile.sh /build/
ADD ./docker/2hol/patches /build/patches

RUN /build/fetch-and-compile.sh

ADD ./docker/2hol/run-server.sh /dist/

FROM busybox:glibc

COPY --from=build /dist /usr

EXPOSE 8006:8005
VOLUME /usr/OneLife/server/data

WORKDIR /usr/OneLife/server
CMD /usr/run-server.sh
STOPSIGNAL SIGTSTP
