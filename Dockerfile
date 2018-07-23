FROM alpine:latest

RUN apk --no-cache add build-base curl git g++ imagemagick xclip sdl-dev mesa-dev make libpng-dev nano

ADD ./docker/fetch-and-compile.sh /opt/
ADD ./docker/patches /opt/patches
RUN cd opt && ./fetch-and-compile.sh


FROM alpine:latest

RUN apk --no-cache add --no-cache libstdc++ expect
COPY --from=0 /opt/OneLife/server /opt/OneLife/server
COPY --from=0 /opt/OneLifeData7/categories /opt/OneLifeData7/categories
COPY --from=0 /opt/OneLifeData7/objects /opt/OneLifeData7/objects
COPY --from=0 /opt/OneLifeData7/transitions /opt/OneLifeData7/transitions
COPY --from=0 /opt/OneLifeData7/dataVersionNumber.txt /opt/OneLifeData7/dataVersionNumber.txt
ADD ./docker/run-server.sh /opt/

EXPOSE 8005
VOLUME /opt/OneLife/server/db

WORKDIR /opt/OneLife/server
CMD /opt/run-server.sh
