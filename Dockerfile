FROM alpine:latest

RUN apk --no-cache add build-base curl git g++ imagemagick xclip sdl-dev mesa-dev make libpng-dev nano

ADD ./cache/ /opt
ADD ./docker/fetch-and-compile.sh /opt/
RUN cd opt && ./fetch-and-compile.sh


FROM alpine:latest

RUN apk --no-cache add --no-cache libstdc++
COPY --from=0 /opt/OneLife/server /opt/OneLife/server
COPY --from=0 /opt/OneLifeData7/categories /opt/OneLifeData7/categories
COPY --from=0 /opt/OneLifeData7/objects /opt/OneLifeData7/objects
COPY --from=0 /opt/OneLifeData7/transitions /opt/OneLifeData7/transitions
COPY --from=0 /opt/OneLifeData7/dataVersionNumber.txt /opt/OneLifeData7/dataVersionNumber.txt

EXPOSE 8005

WORKDIR /opt/OneLife/server
CMD /opt/OneLife/server/OneLifeServer
