ifeq ($(OS), Windows_NT)
	TARGET := libex.dll
else
	TARGET := libex.so
endif

.PHONY: build
build:
	nim c --app:lib -d:release -o:build/$(TARGET) src/example.nim
