FROM --platform=$TARGETPLATFORM node:10-alpine

# Environment variables used by Mathoid
ENV APP_CONFIG_PATH=/srv/mathoid/config.yaml
ENV APP_BASE_PATH=/srv/mathoid/node_modules/mathoid

#
# Healthcheck
#
RUN apk add --no-cache curl
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD curl -f http://localhost:10044/?spec || exit 1

#
# Install Mathoid
#
WORKDIR /srv/mathoid
RUN apk add --no-cache --virtual .build-deps \
    git python make g++ librsvg-dev
RUN apk add --no-cache librsvg-dev
COPY package.json .
RUN yarn --frozen-lockfile

# Remove build dependencies
RUN apk del .build-deps

#
# Config
#
COPY config.yaml .
ENV NODE_ENV=production
EXPOSE 10044
CMD sed -i 's~MATHOID_NUM_WORKERS~'"${MATHOID_NUM_WORKERS:-'ncpu'}"'~' /srv/mathoid/config.yaml &&\
    node $APP_BASE_PATH/server.js
