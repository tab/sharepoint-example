FROM ruby:2.4.6-alpine3.10

WORKDIR /app

COPY . .

RUN apk add --update-cache --no-cache --virtual .build-deps g++ make curl curl-dev \
    && apk add --update-cache --no-cache gcompat git openssh-client \
    && bundle install --jobs $(nproc) --retry 3 \
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete \
    && apk --purge del .build-deps
