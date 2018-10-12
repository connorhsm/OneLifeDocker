FROM buildpack-deps:latest AS build

ADD ./docker/fetch-and-compile.sh /build/
ADD ./docker/patches /build/patches

RUN /build/fetch-and-compile.sh

ADD ./docker/run-server.sh /dist/

FROM busybox:glibc

COPY --from=build /dist /usr

EXPOSE 8005
VOLUME /usr/OneLife/server/data

WORKDIR /usr/OneLife/server
CMD /usr/run-server.sh
STOPSIGNAL SIGTSTP
