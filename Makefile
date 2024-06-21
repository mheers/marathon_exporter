VERSION  := $$(git describe --tags --always)
TARGET   := marathon_exporter
TEST     ?= ./...

default: test build

test:
	go test -v -run=$(RUN) $(TEST)

build: clean
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build \
		-a -tags netgo \
		-ldflags "-X main.Version=$(VERSION)" \
		-o bin/$(TARGET) .

release: build
	docker build -t mheers/$(TARGET):$(VERSION) .

publish: release
	docker push mheers/$(TARGET):$(VERSION)
	docker tag mheers/$(TARGET):$(VERSION) mheers/$(TARGET):latest
	docker push mheers/$(TARGET):latest

clean:
	rm -rf bin/

image:
	docker build -t $(TARGET) .

shell:
	docker run -it --entrypoint /bin/ash $(TARGET)
