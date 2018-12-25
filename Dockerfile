FROM node:latest

MAINTAINER atisak.k@gmail.com

RUN apt-get update && apt-get dist-upgrade -y \
    && rm -rf /var/lib/apt/lists/*

COPY . /apps/
WORKDIR /apps/
RUN npm install
EXPOSE 3000
CMD ["npm","start"]
