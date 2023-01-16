SHELL := /bin/bash
.DEFAULT_GOAL := help

build: ## build work image
	docker run -t -d --name design-patterns -v ./:/app --user=root '/bin/bash' 

ssh: ## ssh docker 
	docker exec -it design-patterns bash

run:
	docker exec -it design-patterns bash

# https://postd.cc/auto-documented-makefile/
help: ## Draw help message
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'