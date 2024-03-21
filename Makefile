all: theme synchronize build

.PHONY: theme
theme:
	@cd themes/doks/ && \
	npm install && \
	rm -rf content

.PHONY: synchronize
synchronize:
	bash -x synchronize.sh

.PHONY: build
build:
	hugo

.PHONY: serve
serve:
	hugo serve
