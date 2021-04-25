FROM node:lts-alpine3.10

RUN apk add openjdk11;
RUN apk add --no-cache git;

RUN git clone https://github.com/mbujes/cibersec-node-docker-jenkins-deploy/

WORKDIR /cibersec-node-docker-jenkins-deploy

RUN npm install;

EXPOSE 3000

CMD ["node", "index.js"];
