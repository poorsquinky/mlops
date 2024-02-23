

default: up

up: run

run: build
	docker compose up

build: jupyter/Dockerfile jupyter/cuda.deb
	docker compose build

jupyter/cuda.deb:
	curl https://developer.download.nvidia.com/compute/cuda/12.0.0/local_installers/cuda-repo-debian11-12-0-local_12.0.0-525.60.13-1_amd64.deb -o cuda.deb

down:
	docker compose down


.PHONY: default up run down build


