FROM node:7.8.0
WORKDIR /home/hedg/cicd-pipeline
ADD . /home/hedg/cicd-pipeline
RUN npm install
ENTRYPOINT npm run start
