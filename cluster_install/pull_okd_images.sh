#!/bin/sh

docker pull docker-repo.sonic.com:443/cockpit/kubernetes:latest
docker pull docker-repo.sonic.com:443/openshift/origin-control-plane:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/origin-deployer:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/origin-docker-registry:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/origin-haproxy-router:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/origin-pod:v3.11.0
docker pull docker-repo.sonic.com:443/coreos/etcd:v3.2.22
docker tag docker-repo.sonic.com:443/coreos/etcd:v3.2.22 quay.io/coreos/etcd:v3.2.22
docker pull docker-repo.sonic.com:443/openshift/oauth-proxy:v1.1.0
docker pull docker-repo.sonic.com:443/grafana/grafana:5.2.1
docker tag docker-repo.sonic.com:443/openshift/oauth-proxy:v1.1.0 openshift/oauth-proxy:v1.1.0
docker tag docker-repo.sonic.com:443/grafana/grafana:5.2.1 grafana/grafana:5.2.1
docker pull docker-repo.sonic.com:443/openshift/origin-logging-curator5:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/prometheus:v2.3.2
docker tag docker-repo.sonic.com:443/openshift/prometheus:v2.3.2 openshift/prometheus:v2.3.2
docker pull docker-repo.sonic.com:443/openshift/prometheus-alertmanager:v0.15.2
docker tag docker-repo.sonic.com:443/openshift/prometheus-alertmanager:v0.15.2 openshift/prometheus-alertmanager:v0.15.2
