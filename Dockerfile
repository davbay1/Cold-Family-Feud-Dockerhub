FROM node:16-alpine


COPY . /src
WORKDIR /src

RUN npm install


RUN apk add ruby bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

EXPOSE 3000

COPY package*.json ./

RUN npm ci
RUN npm run build

CMD ["npm", "run", "start"]

