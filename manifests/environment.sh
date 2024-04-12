#!/usr/bin/bash

# Generate the encryption key required by EncryptionConfig
export ENCRYPTION_KEY=$(head -c 32 /dev/urandom | base64)

# IP array of each machine in the cluster
export NODE_IPS=(103.172.239.9 103.172.238.94 103.172.239.71)

# Array of host names corresponding to each IP in the cluster
export NODE_NAMES=(idc-k8s-01 idc-k8s-02 idc-k8s-03)

# etcd cluster service address list
export ETCD_ENDPOINTS="https://103.172.239.9:2379,https://103.172.238.94:2379,https://103.172.239.71:2379"

# IP and port for etcd inter-cluster communication
export ETCD_NODES="idc-k8s-01=https://103.172.239.9:2380,idc-k8s-02=https://103.172.238.94:2380,idc-k8s-03=https://103.172.239.71:2380"

# Reverse proxy (kube-nginx) address port of kube-apiserver
export KUBE_APISERVER="https://127.0.0.1:8443"

# Inter-node interconnection network interface name
export IFACE="ens192"

# etcd data directory
export ETCD_DATA_DIR="/data/k8s/etcd/data"

# etcd WAL directory, it is recommended to be an SSD disk partition, or a disk partition different from ETCD_DATA_DIR
export ETCD_WAL_DIR="/data/k8s/etcd/wal"

#k8s data directory of each component
export K8S_DIR="/data/k8s/k8s"

## Choose one of DOCKER_DIR and CONTAINERD_DIR
# docker data directory
export DOCKER_DIR="/data/k8s/docker"

# containerd data directory
export CONTAINERD_DIR="/data/k8s/containerd"

## The following parameters generally do not need to be modified.

# Token used by TLS Bootstrapping can be generated using the command head -c 16 /dev/urandom | od -An -t x | tr -d ' '
BOOTSTRAP_TOKEN="41f7e4ba8b7be874fcff18bf5cf41a7c"

# It is best to use currently unused network segments to define service network segments and Pod network segments

# Service network segment, the route is unreachable before deployment, and the route within the cluster is reachable after deployment (guaranteed by kube-proxy)
# SERVICE_CIDR="10.254.0.0/16" (in-use network)
SERVICE_CIDR="10.96.0.0/16"

# Pod network segment, /16 segment address is recommended. The route is unreachable before deployment, and the route within the cluster is reachable after deployment (flanneld guarantee)
CLUSTER_CIDR="172.30.0.0/16"

# Service port range (NodePort Range)
export NODE_PORT_RANGE="30000-32767"

# kubernetes service IP (usually the first IP in SERVICE_CIDR)
export CLUSTER_KUBERNETES_SVC_IP="10.96.0.1"

# Cluster DNS service IP (pre-allocated from SERVICE_CIDR)
export CLUSTER_DNS_SVC_IP="10.96.0.2"

# Cluster DNS domain name (without the dot at the end)
export CLUSTER_DNS_DOMAIN="cluster.local"

# Add the binary directory /opt/k8s/bin to PATH
export PATH=/opt/k8s/bin:$PATH