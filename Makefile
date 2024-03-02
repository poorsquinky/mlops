

default: up

up: run

run: build
	docker compose up

build: jupyter/Dockerfile
	docker compose build --progress plain

down:
	docker compose down

# all of this assumes there's a single Nvidia GPU
precheck:
	echo hihi
	lspci | grep -i nvidia | head | awk '{ print $1 }'
	DEVICE := $(shell lspci | grep -i nvidia | head | awk '{ print $1 }')
	FILE   := /sys/bus/pci/devices/0000:${DEVICE}/numa_node
	NUMA_STATE := $(shell cat ${FILE})
	if [[ ${NUMA_STATE} -ne 0 ]]; then \
		echo "NUMA is not connected to your GPU.  Try:"; \
		echo "    echo 0 | sudo tee ${FILE}"; \
		exit 1; \
	fi


.PHONY: default up run down build precheck


