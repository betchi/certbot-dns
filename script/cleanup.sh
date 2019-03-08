#!/usr/bin/env bash

zoneId=$(cat zoneId.txt)
dnsRecordId=$(cat dnsRecordId.txt)
curl -s -X DELETE "$CLOUDFLARE_API_ENDPOINT/zones/$zoneId/dns_records/$dnsRecordId" \
	-H "X-Auth-Email: ${MAIL}" \
	-H "X-Auth-Key: ${API_KEY}" \
	-H "Content-Type: application/json"

rm -f zoneId.txt dnsRecordId.txt