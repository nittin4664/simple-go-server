GOCMD=go
OUTDIR=out
BINARYNAME=$(OUTDIR)/docker-pro
BINARYNAME-LINUX=$(BINARYNAME)-linux
FILE-LOCS=./...
.PHONY: test
test:
	$(GOCMD) test

.PHONY: clean
clean:
	$(GOCMD) clean
	rm -f $(BINARYNAME)
	rm -f $(BINARYNAME-LINUX)

.PHONY: build
build: 
	$(GOCMD) build -o $(BINARYNAME) $(FILE-LOCS)

.PHONY: build-linux
build-linux:
	GOOS=linux GOARCH=386 CGO_ENABLED=0 $(GOCMD) build -o $(BINARYNAME-LINUX) $(FILE-LOCS)

.PHONY: build-all
build-all: build build-linux

all: clean test build-all