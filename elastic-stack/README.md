# Installing elasticsearch operator:
* https://www.elastic.co/guide/en/cloud-on-k8s/1.9/k8s-deploy-eck.html
```bash
kubectl create -f https://download.elastic.co/downloads/eck/1.9.1/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/1.9.1/operator.yaml
```

## Monitoring the operator's startup logs:
```
kubectl -n elastic-system logs -f statefulset.apps/elastic-operator
```

# Setting UP ElasticStack
```
kubectl apply -f elasticsearch/
kubectl apply -f kibana/
kubectl apply -f apm/
kubectl apply -f logstash/
```

# Setup exporter (deprecated)
To install elastic-exporter, follow the steps in the `monitor/elastic-exporter/README.md`

# Upgrade
To upgrade any component of the stack just change the version inside the yml and apply the new configuration, the operator will take care of any necessary process during the update.
For components that are not part of the operator "logstash, filebeat, metricbeat, etc." there will be no need for any additional process during the update.