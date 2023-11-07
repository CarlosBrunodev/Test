#!/bin/bash

# Obtém a lista de namespaces e armazena em um array
namespaces=($(kubectl get namespaces -o custom-columns=NAMESPACE:.metadata.name --no-headers))

# Loop através dos namespaces
for namespace in "${namespaces[@]}"; do
  echo "Namespace: $namespace"
  # Obtém a lista de deployments no namespace atual
  deployments=($(kubectl get deployments -n $namespace -o custom-columns=DEPLOYMENT:.metadata.name --no-headers))

  # Loop através dos deployments no namespace atual
  for deployment in "${deployments[@]}"; do
    echo "Deployment: $deployment"
    # Obtém os recursos de CPU e memória definidos no deployment
    cpu_request=$(kubectl get deployment $deployment -n $namespace -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}')
    mem_request=$(kubectl get deployment $deployment -n $namespace -o jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}')
    cpu_limit=$(kubectl get deployment $deployment -n $namespace -o jsonpath='{.spec.template.spec.containers[0].resources.limits.cpu}')
    mem_limit=$(kubectl get deployment $deployment -n $namespace -o jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')

    echo "CPU Request: $cpu_request"
    echo "Memory Request: $mem_request"
    echo "CPU Limit: $cpu_limit"
    echo "Memory Limit: $mem_limit"
    echo
  done
done

