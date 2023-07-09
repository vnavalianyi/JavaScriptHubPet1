# use this empty Dockerfile to build your assignment

# NOTE: The instructions are now in the README.md file in this directory.

FROM node:18-alpine

RUN apk add --no-cache tini

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json package.json

RUN npm install && npm cache clean --force

COPY . .

EXPOSE 3000

CMD [ "/sbin/tini", "--", "node", "./bin/www" ]

