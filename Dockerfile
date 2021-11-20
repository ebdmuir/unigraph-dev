FROM node:15-alpine

RUN mkdir /opt/unigraph && mkdir /app
WORKDIR /app

COPY --from=dgraph:latest /usr/local/bin/dgraph /opt/unigraph/dgraph
COPY . /app/

RUN yarn && yarn build-common && sh /app/scripts/build_default_packages.sh