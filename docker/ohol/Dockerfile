FROM buildpack-deps:latest AS build

ADD ./docker/ohol/fetch-and-compile.sh /build/
ADD ./docker/ohol/patches /build/patches

RUN /build/fetch-and-compile.sh

ADD ./docker/ohol/run-server.sh /dist/

FROM busybox:glibc

COPY --from=build /dist /usr

EXPOSE 8005:8005
VOLUME /usr/OneLife/server/data

WORKDIR /usr/OneLife/server
CMD /usr/run-server.sh
STOPSIGNAL SIGTSTP
