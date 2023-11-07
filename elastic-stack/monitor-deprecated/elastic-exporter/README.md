# Install elasticsearch-exporter
```
helm install elastic-exporter --namespace elastic-stack -f values.yaml stable/elasticsearch-exporter
```

# In order to upgrade, run the command bellow
```
helm upgrade elastic-exporter --namespace elastic-stack --wait -f values.yaml stable/elasticsearch-exporter
```