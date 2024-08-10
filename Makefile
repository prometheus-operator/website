TOOLS_BIN_DIR ?= $(shell pwd)/tmp/bin
MDOX_BINARY=$(TOOLS_BIN_DIR)/mdox

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

MDOX_VALIDATE_CONFIG ?= .mdox.validate.yaml

EXCLUDED_FILES := content/docs/api-reference/api.md content/adopters.md $(shell find content -name "_index.md")

MD_FILES_TO_FORMAT = $(filter-out $(EXCLUDED_FILES), $(shell find content -name "*.md"))

.PHONY: docs
docs: $(MDOX_BINARY)
	@echo ">> formatting and local/remote link check"
	$(MDOX_BINARY) fmt --soft-wraps -l --links.localize.address-regex="https://prometheus-operator.dev/.*" --links.validate.config-file=$(MDOX_VALIDATE_CONFIG) $(MD_FILES_TO_FORMAT)

.PHONY: check-docs
check-docs: $(MDOX_BINARY)
	@echo ">> checking formatting and local/remote links"
	$(MDOX_BINARY) fmt --soft-wraps --check -l --links.localize.address-regex="https://prometheus-operator.dev/.*" --links.validate.config-file=$(MDOX_VALIDATE_CONFIG) $(MD_FILES_TO_FORMAT)
