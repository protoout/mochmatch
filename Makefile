DOCKER_COMPOSER_YML = ./.devcontainer/docker-compose.yml

build-all:
	make build-clean; \
	make build-apk; \
	make build-ios; \
	make build-web;

build-apk:
	flutter build apk

build-ios:
	flutter build ios --no-codesign --debug

build-ipa:
	flutter build ipa --debug

build-web:
	flutter build web

build-clean:
	flutter clean

build-install:
	flutter install
