default: version

dev:=boss-crawdad-dev.jamesrcounts.com
prd:=boss-crawdad-prd.jamesrcounts.com
kv:=kv-engaged-emu

version: 
	certbot --version

workspace: 
	mkdir -p ~/certbot/{config,work,log,certs}

issue: issue_dev issue_prd

issue_dev:
	bash ./issue-certs.sh $(dev)
issue_prd:
	bash ./issue-certs.sh $(prd)

pfx: pfx_dev pfx_prd

pfx_dev:
	bash ./create-pfx.sh $(dev)


pfx_prd:
	bash ./create-pfx.sh $(prd)

pem: pem_dev pem_prd

pem_dev:
	bash ./create-pem.sh $(dev)

pem_prd:
	bash ./create-pem.sh $(prd)

upload: upload_dev upload_prd

upload_dev:
	bash ./upload-cert.sh $(dev) $(kv)

upload_prd:
	bash ./upload-cert.sh $(prd) $(kv)