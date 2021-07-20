default: version

dev:=united-monitor-dev.jamesrcounts.com
prd:=united-monitor-prd.jamesrcounts.com
kv:=kv-golden-opossum

version: 
	certbot --version

workspace: 
	mkdir -p ~/certbot/config
	mkdir -p ~/certbot/work
	mkdir -p ~/certbot/log
	mkdir -p ~/certbot/certs

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
	bash ./upload-pfx-cert.sh $(dev) $(kv)
	bash ./upload-pem-cert.sh $(dev) $(kv)

upload_prd:
	bash ./upload-pfx-cert.sh $(prd) $(kv)
	bash ./upload-pem-cert.sh $(prd) $(kv)
