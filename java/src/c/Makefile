CC = gcc
CFLAGS = -Wall -O2
BIN_DIR = build/bin

all: $(BIN_DIR)/hello

$(BIN_DIR)/hello: src/c/hello.c | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ src/c/hello.c

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf build

.PHONY: all clean
