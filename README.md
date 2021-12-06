# Flitz Technologies [Helm](https://helm.sh) Charts

This respoitory contains [Helm](https://helm.sh) charts for the following projects:

* [LNDHub](charts/lndhub)
* [LND](charts/lnd) (copy of [Fold's chart](https://github.com/fold-team/helm-charts/tree/master/charts/lnd))
* [C-Lightning](charts/c-lightning)
* [Bitcoind](charts/bitcoind)


The workflow will package all these charts on push, and publish them on github pages

```
helm repo add flitz https://flitz-be.github.io/helm-charts/
helm install lnd flitz-helm-charts/lnd
```