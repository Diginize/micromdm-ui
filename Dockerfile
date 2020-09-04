FROM node-alpine as build
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN npm i
COPY . .
RUN NODE_ENV=production ./node_modules/.bin/webpack --progress --colors


FROM nginx:stable-alpine
MAINTAINER mosen <mosen@users.noreply.github.com>
COPY --from=build /usr/src/app/public /usr/share/nginx/html
