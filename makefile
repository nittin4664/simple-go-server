GOCMD=go
OUTDIR=out
BINARYNAME=docker-pro
BINARYNAME-LINUX=$(BINARYNAME)-linux
FILE-LOCS=./...
.PHONY: test
test:
	$(GOCMD) test

.PHONY: clean
clean:
	$(GOCMD) clean

.PHONY: build
build: 
	$(GOCMD) build -o $(OUTDIR)/$(BINARYNAME) $(FILE-LOCS)

.PHONY: build-linux
build-linux:
	GOOS=linux GOARCH=386 CGO_ENABLED=0 $(GOCMD) build -o $(OUTDIR)/$(BINARYNAME-LINUX) $(FILE-LOCS)

.PHONY: build-all
build-all: build build-linux

all: clean test build-all