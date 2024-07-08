PROG = gtkmm-app

all: build

build:
	meson _build && \
	ninja -C _build

install:
	cp _build/$(PROG) ../../bin

clean:
	rm -rf _build
