FROM node:12-alpine as build
MAINTAINER Digitransit version: 0.1

WORKDIR /opt/digitransit-graphql

COPY . ./
RUN yarn && yarn build

FROM node:12-alpine
WORKDIR /app
COPY --from=build /opt/digitransit-graphql/build ./
RUN yarn global add serve
EXPOSE 8080
CMD ["serve", "-l", "8080", "-s"]
