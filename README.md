# etcd-dashboard

## Sobre o que é esse repositório

Ferramenta de validações para criptografia do etcd em clusters OpenShift. Permite monitorar em tempo real o consumo de memória e latência de disco durante a adição de camadas de criptografia, garantindo que o desempenho do etcd permaneça dentro dos padrões aceitáveis para o bom funcionamento do OpenShift.

## Tutorial passo a passo

*Em breve*

## Validações e Conclusões

Na raiz do repositório há um comando com o exemplo de validação de um objeto dentro do pod do ETCD. Ele é uma referência e deve ser adequado de acordo com suas necessidades. Peço que verifiquem o arquivo *validacao.txt*.

## Sugestões de melhorias

<!-- readme-tree start -->
```
.
├── .github
│   └── workflows
│       ├── auto-pr-dev.yaml
│       └── readme-tree.yaml
├── 00-grafana-instance.yaml
├── 01-grafana-route.yaml
├── 02-grafana-rbac.sh
├── 03-grafanaDatasource.yaml
├── 04-sa-grafana.yaml
├── README.md
├── grafana-dashboard
│   ├── etcd-health-monitoring-dashboard.json
│   ├── etcd-health-monitoring-dashboard_resourcev1.json
│   ├── etcd-health-monitoring-dashboard_resourcev2.json
│   └── etcd-health-monitoring-dashboard_resourcev3.json
├── scripts
│   ├── clean-30.sh
│   ├── stress-etcd.sh
│   └── super-stress-etcd.sh
├── tree.bak
└── validacao.txt

5 directories, 17 files
```
<!-- readme-tree end -->
