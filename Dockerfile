FROM certbot/certbot:latest

RUN apk add --update \
  && apk --no-cache add curl jq bash

WORKDIR /script

ENTRYPOINT ["/script/entry.sh"]
