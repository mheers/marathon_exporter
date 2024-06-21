# Marathon Prometheus Exporter
 

[![Build Status](https://travis-ci.org/mheers/marathon_exporter.svg?branch=master)](https://travis-ci.org/mheers/marathon_exporter)
[![Docker Pulls](https://img.shields.io/docker/pulls/gettyimages/marathon_exporter.svg)](https://hub.docker.com/r/gettyimages/marathon_exporter/)

A [Prometheus](http://prometheus.io) metrics exporter for the [Marathon](https://mesosphere.github.io/marathon) Mesos framework.

This exporter exposes Marathon's Codahale/Dropwizard metrics via its `/metrics` endpoint. To learn more, visit the [Marathon metrics doc](http://mesosphere.github.io/marathon/docs/metrics.html).

Note: version v1.5.1+ of this exporter is not compatible with marathon 1.4.0 and below.

## Getting

```sh
$ go get github.com/mheers/marathon_exporter
```

*\-or-*

```sh
$ docker pull mheers/marathon_exporter
```

*\-or-* locally build image:

```
make image
docker run -it marathon_exporter --help
```

## Using

```sh
Usage of marathon_exporter:
  -marathon.uri string
        URI of Marathon (default "http://marathon.mesos:8080")
        Note: Supply HTTP Basic Auth (i.e. user:password@example.com)
  -web.listen-address string
        Address to listen on for web interface and telemetry. (default ":9088")
  -web.telemetry-path string
        Path under which to expose metrics. (default "/metrics")
```
