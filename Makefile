ifeq ($(OS), Windows_NT)
	MKD := cmd /C mkdir
	TARGET := libex.dll
else
	MKD := mkdir -p
	TARGET := libex.so
endif

.PHONY: build
build:
	$(MKD) build
	nim c --app:lib -d:release -o:build/$(TARGET) src/example.nim
