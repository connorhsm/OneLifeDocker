FROM buildpack-deps:latest AS build

ADD ./docker/fetch-and-compile.sh /opt/
ADD ./docker/patches /opt/patches

RUN cd opt && ./fetch-and-compile.sh



FROM ubuntu:latest

COPY --from=build /opt/OneLife/server /opt/OneLife/server
COPY --from=build /opt/OneLifeData7/categories /opt/OneLifeData7/categories
COPY --from=build /opt/OneLifeData7/objects /opt/OneLifeData7/objects
COPY --from=build /opt/OneLifeData7/transitions /opt/OneLifeData7/transitions
COPY --from=build /opt/OneLifeData7/dataVersionNumber.txt /opt/OneLifeData7/dataVersionNumber.txt
COPY --from=build /opt/versionNumber.txt /opt/versionNumber.txt

ADD ./docker/run-server.sh /opt/

EXPOSE 8005
VOLUME /opt/OneLife/server/data

WORKDIR /opt/OneLife/server
CMD /opt/run-server.sh
STOPSIGNAL SIGTSTP
