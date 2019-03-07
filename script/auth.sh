#!/usr/bin/env bash

CREATE_DOMAIN="_acme-challenge.$CERTBOT_DOMAIN"

zoneId=$(curl -s -X GET "$baseUrl/zones?name=${DOMAIN}&status=active&page=1&per_page=20&order=status&direction=desc&match=all" \
	-H "X-Auth-Email: ${MAIL}" \
	-H "X-Auth-Key: ${API_KEY}" \
	-H "Content-Type: application/json" \
	| jq -r '.result[0].id')
if [ $? -gt 0 ]; then
  exit 1
fi
export dnsRecordId=$(curl -s -X POST "$baseUrl/zones/$zoneId/dns_records" \
	-H "X-Auth-Email: ${MAIL}" \
	-H "X-Auth-Key: ${API_KEY}" \
	-H "Content-Type: application/json" \
	--data "{\"name\":\"$CREATE_DOMAIN\",\"type\":\"TXT\",\"content\":\"$CERTBOT_VALIDATION\"}" \
	| jq -r '.result.id')
if [ $? -gt 0 ]; then
  exit 1
fi