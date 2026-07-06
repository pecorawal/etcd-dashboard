#!/bin/bash
# stress-aro.sh

NAMESPACE="aro-crypto-stress"

# Garante que o namespace existe
oc create namespace $NAMESPACE 2>/dev/null

echo "--- Preparando Payload de Carga (50KB) ---"
# Geramos o bloco de dados UMA vez fora do loop e limpamos as quebras de linha (\n)
DATA=$(head -c 51200 /dev/urandom | base64 | tr -d '\n')

echo "--- Iniciando Carga Massiva contra o etcd ---"

for i in {1..2000}; do
    # Dispara a criação em background jogando para o cluster de fato
    oc create configmap stress-obj-$i --from-literal=payload="$DATA" -n $NAMESPACE > /dev/null 2>&1 &

    # Limita o paralelismo para 40 requisições simultâneas
    if (( $i % 40 == 0 )); then 
        wait
        echo "Enviados $i objetos..."
    fi
done

# Aguarda os últimos processos em background terminarem
wait
echo "--- Carga finalizada. Verifique o Dashboard. ---"
