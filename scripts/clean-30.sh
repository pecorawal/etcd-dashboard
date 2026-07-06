#!/bin/bash
# clean-aro-30.sh

NAMESPACE="aro-crypto-stress"

echo "--- Iniciando Remoção Gradual (Lotes de 30) ---"

for i in {1..5000}; do
    # Verifica primeiro se o configmap existe antes de tentar deletar
    oc delete configmap super-obj-$i -n $NAMESPACE --grace-period=0 --force &

    # Limita o paralelismo para lotes de 30
    if (( $i % 30 == 0 )); then
        wait
        echo "Lote de $i objetos processado na fila de deleção..."
    fi
done

wait
echo "--- Limpeza Concluída. Acompanhe a compactação no Grafana. ---"
