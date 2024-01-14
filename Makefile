DOCKER_COMPOSER_YML = ./.devcontainer/docker-compose.yml

build-apk:
	flutter build apk

build-ios:
	flutter build ios

build-web:
	flutter build web

build-all:
	make build-apk; \
	make build-ios; \
	make build-web;

dc-build: ${DOCKER_COMPOSER_YML}
	docker compose --file=${DOCKER_COMPOSER_YML} build

dc-down: ${DOCKER_COMPOSER_YML}
	docker compose --file=${DOCKER_COMPOSER_YML} down

dc-up: ${DOCKER_COMPOSER_YML}
	docker compose --file=${DOCKER_COMPOSER_YML} up -d

dc-exec: ${DOCKER_COMPOSER_YML}
	docker compose --file=${DOCKER_COMPOSER_YML} exec mochmatch /bin/bash

dc-clean: ${DOCKER_COMPOSER_YML}
	make dc-down
	make dc-build && make dc-up && make dc-exec
