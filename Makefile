.PHONY: build
build:
	nim c --app:lib -d:release src/fib.nim
