COMMANDS := $(MAKEFILE_LIST)

include .env
export

# Check if container-structure-test is present
CONTAINER_TEST := $(shell command -v container-structure-test 2>/dev/null)

build:
	@shef build install.recipe build/install
install:
	@/bin/bash build/install

build-docker:
	@docker-compose build zsh-recipe

test: test-acceptance
test-acceptance:
ifndef CONTAINER_TEST
	@echo "container-structure-test is not available. Follow instructions here : https://github.com/GoogleContainerTools/container-structure-test"
	exit 1
endif

	@container-structure-test test --image registry.gitlab.com/leonardmessier/shef/recipes/zsh-recipe:1.0.0 --config tests/acceptance/cst.yml
	@echo "\033[32m✓\033[0m Acceptance tests passed"


.PHONY: build install
