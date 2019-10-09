#!/bin/sh

yum -y install docker
docker pull docker-repo.sonic.com:443/cockpit/kubernetes:latest
docker pull docker-repo.sonic.com:443/openshift/origin-control-plane:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/origin-deployer:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/origin-docker-registry:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/origin-haproxy-router:v3.11.0
docker pull docker-repo.sonic.com:443/openshift/origin-pod:v3.11.0
docker pull docker-repo.sonic.com:443/coreos/etcd:v3.2.22
docker tag docker-repo.sonic.com:443/coreos/etcd:v3.2.22 quay.io/coreos/etcd:v3.2.22
