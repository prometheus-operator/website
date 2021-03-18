all: theme synchronize public

.PHONY: synchronize
synchronize:
	bash synchronize.sh

.PHONY: theme
theme:
	cd themes/doks/ && \
	npm install && \
	rm -rf content

.PHONY: public
public:
	hugo
