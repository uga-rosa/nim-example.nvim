ifeq ($(OS), Windows_NT)
	MKD := cmd /C mkdir
	TARGET := libfib.dll
else
	MKD := mkdir -p
	TARGET := libfib.so
endif

.PHONY: build
build:
	$(MKD) build
	nim c --app:lib -d:release -o:build/$(TARGET) src/fib.nim
