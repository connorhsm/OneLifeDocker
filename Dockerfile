FROM ubuntu:latest

RUN apt-get update && apt-get install -y git g++ imagemagick xclip libsdl1.2-dev libglu1-mesa-dev libgl1-mesa-dev

ADD ./docker/fetch-and-compile.sh /opt/
ADD ./docker/patches /opt/patches
RUN cd opt && ./fetch-and-compile.sh


FROM ubuntu:latest

RUN apt-get update && apt-get install -y expect
COPY --from=0 /opt/OneLife/server /opt/OneLife/server
COPY --from=0 /opt/OneLifeData7/categories /opt/OneLifeData7/categories
COPY --from=0 /opt/OneLifeData7/objects /opt/OneLifeData7/objects
COPY --from=0 /opt/OneLifeData7/transitions /opt/OneLifeData7/transitions
COPY --from=0 /opt/OneLifeData7/dataVersionNumber.txt /opt/OneLifeData7/dataVersionNumber.txt
ADD ./docker/run-server.sh /opt/

EXPOSE 8005
VOLUME /opt/OneLife/server/data

WORKDIR /opt/OneLife/server
CMD /opt/run-server.sh
