# LND

[LND](https://github.com/lightningnetwork/lnd) is an implementation of a
Lightning Network Node. The Lightning Network is a "Layer 2" payment protocol
that operates on top of a blockchain-based cryptocurrency. It features a
peer-to-peer system for making micropayments of cryptocurrency through a
network of bidirectional payment channels without delegating custody of funds.

## Introduction

This chart bootstraps a single LND node. The default docker image is taken from
[BTCPayServer](https://hub.docker.com/r/btcpayserver/lnd)'s dockerhub
repository. By default it runs a testnet node using neutrino.

## Prerequisites

* Kubernetes 1.8+
* PV provisioner support
* Running Bitcoind (or a neutrino node to connect to)

## Installing the Chart

To install the chart with the release name `my-release`:

```
$ helm install --name my-release fold/lnd
```

This command deploys a testnet instance of lnd on the Kubernetes cluster in the
default configuration. The [configuration](#configuration) section lists the
parameters that can be configured during installation.

After the instance deploys you need to exec into the pod and create a new
wallet. It will ask you to create a password that you will need in the next
step.

```
NETWORK=testnet
MY_RELEASE=my-release
kubectl exec -it $(kubectl get pod -l "release=$MY_RELEASE" -o jsonpath='{.items[0].metadata.name}') -- lncli -n $NETWORK create
```

Make sure the password matches the one specified in the values.yaml.
After the wallet has initialized, uncomment the `wallet-unlock-password-file` option in the lnd.conf sections of the values.
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

## Configuration

The following tables list the configurable parameters of the lnd chart and
their default values.

Parameter                  | Description                        | Default
-----------------------    | ---------------------------------- | ----------------------------------------------------------
`image.repository`         | Image source repository name       | `btcpayserver/lnd`
`image.tag`                | `lnd` release tag.                 | `v0.14.1-beta`
`image.pullPolicy`         | Image pull policy                  | `IfNotPresent`
`internalServices.rpcPort` | RPC Port                           | `10009`
`externalServices.p2pPort` | P2P Port                           | `9735`
`persistence.enabled`      | Save node state                    | `true`
`persistence.accessMode`   | ReadWriteOnce or ReadOnly          | `ReadWriteOnce`
`persistence.size`         | Size of persistent volume claim    | `5Gi`
`resources`                | CPU/Memory resource requests/limits| `{}`
`configurationFile`        | Config file ConfigMap entry        |
`autoUnlockPassword`       | Password used to unlock the wallet | `password`