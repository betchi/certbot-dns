# Certbot for DNS record Domain Validation

## Support DNS server

* Cloudflare

## How to use

```
yes | sudo docker run -i \
	-e API_KEY=CLOUDFLARE_API_KEY \
	-e MAIL=CLOUDFLARE_MAIL \
  -e DOMAIN=ZONE_DOMAIN \
	-v ${PWD}/script:/script \
	-v ${PWD}/etc/letsencrypt:/etc/letsencrypt \
	--rm betchi/certbot-dns \
	-m DOMAIN_MAIL \
	-d DOMAIN
```