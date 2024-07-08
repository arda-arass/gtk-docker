PROG = gtk-app
SRCS = main.c

all: build

build:
	gcc `pkg-config --cflags gtk4` $(SRCS) -o $(PROG) `pkg-config --libs gtk4`

install:
	cp $(PROG) ../../bin

clean:
	rm -f $(PROG)
