# more detail: https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

FROM node:latest
COPY hello.js ./
ENTRYPOINT node hello.js

# docker build . --tag hellofromnode
# docker stop hellofromnode
# docker run hellofromnode