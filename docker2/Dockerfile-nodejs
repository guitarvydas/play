FROM node:latest

RUN apt-get update

COPY tasks.bash .
COPY task.bash .
COPY atask.bash .
COPY hello.js .
COPY hello.py .
COPY hello.pl .
COPY hello1.pl .

RUN chmod a+x ./*.bash
ENTRYPOINT ["./tasks.bash"]
