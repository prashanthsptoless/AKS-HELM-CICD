default: all

all: base dev prd

base:
	cd infrastructure/stages/base && \
		make && \
		make apply

dev:
	cd infrastructure/stages/kubernetes-dev && \
		make && \
		make apply

prd:
	cd infrastructure/stages/kubernetes-prd && \
		make && \
		make apply