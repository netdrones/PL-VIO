TAG = 0.0.1
ORG ?= ghcr.io/netdrones
IMAGE ?= plvio
DOCKERFILE ?= Dockerfile

DOCKERNAME = "${ORG}/${IMAGE}:${TAG}"

.PHONY: build
build:
	docker build -t "${DOCKERNAME}" -f "${DOCKERFILE}" .

.PHONY: run
run:
	sudo sh +x run.sh
