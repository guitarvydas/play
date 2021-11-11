FROM ubuntu:latest
RUN apt-get update

COPY hello.bash ./
RUN chmod a+x ./hello.bash
ENTRYPOINT ./hello.bash

# docker build . --tag hellofrombash
# docker stop hellofrombash
# docker run hellofrombash
