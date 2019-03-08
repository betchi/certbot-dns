#!/usr/bin/env bash

targetDomain=""
cfEmail=""
FLAG_F_DOMAIN=true
domain() {
  targetDomain="${targetDomain} -d $1"
  if $FLAG_F_DOMAIN ; then
     FLAG_F_DOMAIN=false
     first_domain=`echo $1 | sed -e "s/\*\.//"`
  fi
}
mail() {
  cfEmail="--email $1"
}

while getopts :m:d:h OPT
do
    case $OPT in
        m)  mail $OPTARG
            ;;
        d)  domain $OPTARG
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
        :) echo "Option -$OPTARG requires an argument." >&2
           exit 1
           ;;
    esac
done
shift $((OPTIND - 1))

if [ -z "$targetDomain" ]; then
  echo "Option -d is required" >&2
  exit 1
fi

if [ -z "$cfEmail" ]; then
  echo "Option -m is required" >&2
  exit 1
fi

certbotServer=https://acme-v02.api.letsencrypt.org/directory
if [ -n "$STAGING" ]; then
  if [ $STAGING = "true" ]; then
    certbotServer=https://acme-staging.api.letsencrypt.org/directory
  fi
fi
echo "Certbot Server=$certbotServer"

certbot certonly --manual \
  --non-interactive \
  --agree-tos \
  --preferred-challenges dns \
  --manual-auth-hook ./auth.sh \
  --manual-cleanup-hook ./cleanup.sh \
  --server $certbotServer \
  --break-my-certs \
  $cfEmail $targetDomain

rm -f tmp_result