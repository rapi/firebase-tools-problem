FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install openjdk-11-jre -y
RUN apt-get install make -y
RUN apt-get install gcc build-essential -y
RUN curl -sL https://deb.nodesource.com/setup_19.x | bash
RUN apt-get install nodejs -y
RUN npm i yarn -g
RUN useradd node
#
USER node
WORKDIR /home/node
COPY . /home/node
COPY --chown=node:node . .
RUN yarn install
CMD ["yarn", "firebase","emulators:start","--project=local"]
