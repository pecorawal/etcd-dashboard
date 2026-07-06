# 1. Criar a conta de serviço
oc create sa grafana-monitoring -n monitoring-stress

# 2. Dar permissão de leitura de métricas do cluster
oc adm policy add-cluster-role-to-user cluster-monitoring-view -z grafana-monitoring -n monitoring-stress

# 3. Gerar o token (válido para OCP 4.11+)
oc create token grafana-monitoring -n monitoring-stress
