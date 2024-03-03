

default: up

up: run

run: build setup
	docker compose up

build: jupyter/Dockerfile feast/Dockerfile
	docker compose build --progress plain

down:
	docker compose down

# all of this assumes there's a single Nvidia GPU
check_numa:
	@lspci | grep -i nvidia | head | awk '{ print $1 }'
	@DEVICE := $(shell lspci | grep -i nvidia | head | awk '{ print $1 }')
	@FILE   := /sys/bus/pci/devices/0000:${DEVICE}/numa_node
	@NUMA_STATE := $(shell cat ${FILE})
	@if [[ ${NUMA_STATE} -ne 0 ]]; then \
		echo "NUMA is not connected to your GPU.  Try:"; \
		echo "    echo 0 | sudo tee ${FILE}"; \
		exit 1; \
	fi

setup: build feast/repo/feature_store.yaml feast/repo/data

feast/repo/data:
	docker compose run --rm -t feast bash -c 'cd /repo && feast apply'

feast/repo/feature_store.yaml: feast/repo
	docker compose run --rm -t feast feast init repo
	cp feast/feature_store.yaml feast/repo

feast/repo:
	mkdir -p feast/repo

.PHONY: default up run down build check_numa setup


