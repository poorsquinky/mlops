

default: up

up: run

run: build
	docker compose up

build: docker-compose.yaml jupyter/Dockerfile
	docker compose build

down:
	docker compose down


.PHONY: default up run down build


