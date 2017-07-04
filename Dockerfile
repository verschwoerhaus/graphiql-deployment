FROM       node:8.1-alpine
MAINTAINER Digitransit version: 0.1

WORKDIR /opt/digitransit-graphql

ADD package-lock.json package.json *.html *.js /opt/digitransit-graphql/
RUN npm install
expose 8080
CMD ["node", "index.js"]
