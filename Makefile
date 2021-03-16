
TAG ?= 21.2I-20210304_dev_common.0.0857

all: up

build:
	docker-compose build --no-cache --build-arg TAG=${TAG} 

pktgen:
	scripts/crpd_present.sh && make -C pktgen

modprobe:
	sudo modprobe ip_tunnel
	sudo modprobe mpls_gso
	sudo modprobe mpls_router
	sudo modprobe mpls_iptunnel

up: down modprobe
	docker-compose up -d
	./validate.sh

frr: build down
	sudo modprobe l2tp-eth
	docker-compose -f docker-compose-frr.yml up -d
	scripts/add_link.sh spine1 r1
	scripts/add_link.sh spine1 r2
	scripts/add_link.sh spine1 r3
	scripts/add_link.sh spine1 host1
	scripts/add_link.sh spine1 host2
	./validate.sh

mac:
	docker-compose build
	docker-compose up -d
	./validate-mac.sh

down:
	docker-compose down
	sudo gzip -d */juniper.conf.gz || true
	sudo chown -R ${USER} */juniper.conf
