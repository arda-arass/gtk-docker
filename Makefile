all: build

ROOT_DIR=${PWD}

DOCKER_IMG = gtk-build-docker
DOCKER_NAME = gtkdev
MODULE_TO_VIEW = gtkmm-app
MODULES := src/gtk-app src/gtkmm-app
DROOTDIR = /workspace

build:
	docker build -t $(DOCKER_IMG) -f Dockerfile .

run:
	docker run -ti -d --name gtkdev \
	-e DISPLAY=$(DISPLAY) \
	--cap-add=SYS_PTRACE \
	-e "USER=$(USER)" -e "UID=$(id -u)" -e "GID=$(id -g)" \
	-v $(ROOT_DIR):$(DROOTDIR) \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	$(DOCKER_IMG):latest

dmodule:
	$(foreach dir,$(MODULES),$(MAKE) -C $(dir) all;)

dinstall:
	mkdir -p bin
	$(foreach dir,$(MODULES),$(MAKE) -C $(dir) install;)

dclean:
	$(foreach dir,$(MODULES),$(MAKE) -C $(dir) clean;)
	rm -rf bin

shell:
	docker exec -ti $(DOCKER_NAME) /bin/bash

view:
	docker exec -ti $(DOCKER_NAME) $(DROOTDIR)/bin/$(MODULE_TO_VIEW)

module:
	docker exec -ti $(DOCKER_NAME) make dmodule

install:
	docker exec -ti $(DOCKER_NAME) make dinstall

clean:
	docker exec -ti $(DOCKER_NAME) make dclean