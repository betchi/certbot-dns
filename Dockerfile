FROM certbot/certbot:latest

ENV CLOUDFLARE_API_ENDPOINT https://api.cloudflare.com/client/v4

RUN apk add --update \
  && apk --no-cache add curl jq bash

ADD script /script
WORKDIR /script

ENTRYPOINT ["./entry.sh"]