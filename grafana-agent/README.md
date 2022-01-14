# Grafana Cloud Monitoring resources

This chart installs Grafana Agent Operator and some CRD's, which will ship your metrics and logs to Grafana Cloud.
Based on:

1. https://grafana.com/docs/agent/latest/operator/helm-getting-started/
2. https://grafana.com/docs/agent/latest/operator/custom-resource-quickstart/
3. https://grafana.com/docs/agent/latest/operator/add-custom-scrape-jobs/


LNDMon's default dashboards don't work out of the box so a bit of hacking was required. The adjusted dashboards can be found in `dashboards`, along with a Loki dashboard.
To import the dashboards in Grafana, copy the contents of the files in `dashboards/` and use the Grafana web client to import them.

This chart expects two secrets in the default namespace in order to connect to Grafana Cloud:

```
apiVersion: v1
kind: Secret
metadata:
  name: primary-credentials-metrics
  namespace: default
stringData:
  username: 'USERNAME'
  password: 'PASSWORD'
```

```
apiVersion: v1
kind: Secret
metadata:
  name: primary-credentials-logs
  namespace: default
stringData:
  username: 'USERNAME'
  password: 'PASSWORD'
```

You can generate these credentials on https://grafana.com.