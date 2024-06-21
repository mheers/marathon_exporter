FROM golang:1.22-alpine as builder
RUN apk add --update \
  make \
  git \
  && rm -rf /var/cache/apk/*
RUN mkdir -p /go/src/github.com/gettyimages/marathon_exporter
ADD . /go/src/github.com/gettyimages/marathon_exporter
WORKDIR /go/src/github.com/gettyimages/marathon_exporter
RUN make build

FROM alpine:3.19

COPY --from=builder /go/src/github.com/gettyimages/marathon_exporter/bin/marathon_exporter /marathon_exporter
ENTRYPOINT ["/marathon_exporter"]

EXPOSE 9088
