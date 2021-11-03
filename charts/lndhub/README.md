# LNDHub Helm chart
## Introduction
[LNDHub](https://github.com/BlueWallet/LndHub) is a wrapper for Lightning Network Daemon (lnd). It provides separate accounts with minimum trust for end users.

## Prerequisites

* Kubernetes 1.8+
* A Redis database
* An LND node (possibly running in the same k8s namespace or cluster). Install with [Fold's lnd chart](https://github.com/thesis/helm-charts).

- Create a secret with config:
```
kubectl create secret generic lndhub-config --from-literal=config='{ "redis": { "port": 6379, "host": "$REDIS_IP", "tls": {},  "family": 4, "password": "$REDIS_PASSWORD", "db": 0 }, "lnd": { "url": "$LND_IP:$LND_GRPC_PORT", "password": ""}}'
```
- Create a secret with the LND credentials:
```
kubectl create secret generic lnd-credentials --from-file=admin.macaroon --from-file=tls.cert
```

## Installing the Chart

To install the chart with the release name `my-release`:

```
$ git clone https://github.com/flitz-be/helm-charts
$ cd helm-charts/charts/lndhub
$ helm upgrade --install my-release .
```
## Configuration

The following tables list the configurable parameters of the lndhub chart and
their default values.

Parameter                  | Description                        | Default
-----------------------    | ---------------------------------- | ----------------------------------------------------------
`image.repository`         | Image source repository name       | `bluewalletorganization/lndhub`
`image.tag`                | `lndhub` release tag.                 | `v1.4.1`
`image.pullPolicy`         | Image pull policy                  | `IfNotPresent`
`resources`                | CPU/Memory resource requests/limits| `{}`