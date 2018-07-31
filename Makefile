IMAGE_NAME=oc-observe


v1.5.1: OPENSHIFT_CLIENT_VERSION=v1.5.1
v1.5.1: OPENSHIFT_CLIENT_HASH=7b451fc
v1.5.1: build

v3.6.0: OPENSHIFT_CLIENT_VERSION=v3.6.0
v3.6.0: OPENSHIFT_CLIENT_HASH=c4dd4cf
v3.6.0: build

v3.6.1: OPENSHIFT_CLIENT_VERSION=v3.6.1
v3.6.1: OPENSHIFT_CLIENT_HASH=008f2d5
v3.6.1: build

v3.7.1: OPENSHIFT_CLIENT_VERSION=v3.7.1
v3.7.1: OPENSHIFT_CLIENT_HASH=ab0f056
v3.7.1: build

v3.9.0: OPENSHIFT_CLIENT_VERSION=v3.9.0
v3.9.0: OPENSHIFT_CLIENT_HASH=191fece
v3.9.0: build


.PHONY: build

compile-oc:
	git clone https://github.com/openshift/origin.git --branch v3.6.1
	cd origin
	git cherry-pick 756f7d
	make build WHAT=cmd/oc
	cp _output/local/bin/linux/amd64/oc ./oc
	cd..
	rm -rf origin

build:
	docker build --no-cache --build-arg OPENSHIFT_CLIENT_VERSION=$(OPENSHIFT_CLIENT_VERSION) --build-arg OPENSHIFT_CLIENT_HASH=$(OPENSHIFT_CLIENT_HASH) -t $(IMAGE_NAME):$(OPENSHIFT_CLIENT_VERSION) .
