# [Helm](https://helm.sh) charts maintained by Kwinten

This respoitory contains [Helm](https://helm.sh) charts for:


- a generic microservice
- staples like nginx, cert-manager, postgres,..
- some analytics tools like superset, datadog agent, ..
- bitcoin-related software: bitcoind, lnd, eclair, cln,..


```
helm repo add flitz https://flitz-be.github.io/helm-charts/
helm install lnd flitz/lnd
```
