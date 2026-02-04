.PHONY: all build clean configure install test

all: configure build

configure:
	./configure

build:
	cargo build --release

clean:
	cargo clean

install: build
	cargo install --path .

test:
	cargo test