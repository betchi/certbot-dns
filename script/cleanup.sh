#!/usr/bin/env bash

curl -s -X POST "$baseUrl/zones/$zoneId/dns_records/$dnsRecordId" \
	-H "X-Auth-Email: ${MAIL}" \
	-H "X-Auth-Key: ${API_KEY}" \
	-H "Content-Type: application/json"