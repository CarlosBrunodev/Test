# ElastAlert
* Doc: https://github.com/jertel/elastalert2/tree/master/chart/elastalert2


## Install/Upgrade
1. Apply ElastAlert Config Settings
```bash
$ kubectl apply -f 1-elastalert-config-secret.yaml
```
1. Config RulesSecret
```bash
$ kubectl create secret generic elastalert-rules-secret --namespace elastic-stack  --from-file=2-raw-alerts/ --dry-run=client -o yaml | kubectl apply -f -
```
2. Install/Upgrade 
```bash
helm upgrade -i elastalert2 elastalert2/elastalert2 -n elastic-stack -f values.yaml 
```
* Deve-se atualizar manualmente o arquivo de VALUES com o nome das RULES (secretRulesList: ["RULE_NAME-1", "RULE_NAME-2"])