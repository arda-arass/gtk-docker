all: build

DOCKER = gtk-build-docker
MODULES := src/gtk-app src/gtkmm-app

module:
	$(foreach dir,$(MODULES),$(MAKE) -C $(dir) all;)

build:
	docker build -t $(DOCKER) -f Dockerfile .

run:
	docker run -ti --rm -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix $(DOCKER):latest

shell:
	docker run -i -t $(DOCKER):latest /bin/bash

install:
	mkdir bin
	$(foreach dir,$(MODULES),$(MAKE) -C $(dir) install;)

clean:
	$(foreach dir,$(MODULES),$(MAKE) -C $(dir) clean;)
	rm -rf bin
