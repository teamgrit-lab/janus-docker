
TEMPLATE_NAME ?= agilertc/agile-mcu:1.0.11
PORTS = -p 0.0.0.0:8088:8088 -p 0.0.0.0:8188:8188
VOLUMES = -v scripts:/tmp/scripts
ENV = 


usage:
	@echo ""
	@echo "usage: make [edit|build|push]"
	@echo ""

push:
	@docker push $(TEMPLATE_NAME)
pull:
	@docker pull $(TEMPLATE_NAME)

shell:
	#docker run --rm --name $(NAME)-$(INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(TEMPLATE_NAME) /bin/bash
	docker run --rm -i -t $(PORTS) $(VOLUMES) $(ENV) $(TEMPLATE_NAME) /bin/bash

build:
	#CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ${BINARY}
	#docker-compose build mcu
	@docker build -t $(TEMPLATE_NAME) .

clean:
	docker system prune
