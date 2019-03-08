# Certbot for DNS record Domain Validation

## Support DNS server

* Cloudflare

## How to use

```
docker run -i --rm \
	-e API_KEY=CLOUDFLARE_API_KEY \
	-e MAIL=CLOUDFLARE_MAIL \
  -e DOMAIN=ZONE_DOMAIN \
	-v ${PWD}/etc/letsencrypt:/etc/letsencrypt \
	betchi/certbot-dns \
	-m DOMAIN_MAIL \
	-d DOMAIN

	# For staging
	-e STAGING=true

	# Override script
	-v ${PWD}/script:/script
```