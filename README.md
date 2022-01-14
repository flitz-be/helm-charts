# Flitz Technologies [Helm](https://helm.sh) Charts

This respoitory contains [Helm](https://helm.sh) charts for the following projects:

* [LNDHub](charts/lndhub)
* [LND](charts/lnd) (copy of [Fold's chart](https://github.com/fold-team/helm-charts/tree/master/charts/lnd))
* [C-Lightning](charts/c-lightning)
* [Eclair](charts/eclair)
* [Bitcoind](charts/bitcoind)
* [Nginx](charts/nginx-ingress)
* [Grafana-agent](charts/grafana-agent)
* [Cert-manager](charts/cert-manager)
* [Redis](charts/redis)


```
helm repo add flitz https://flitz-be.github.io/helm-charts/
helm install lnd flitz/lnd
```