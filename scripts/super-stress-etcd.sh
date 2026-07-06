#!/bin/bash
# super-stress-aro.sh

NAMESPACE="aro-crypto-stress"

# Garante que o namespace existe
oc create namespace $NAMESPACE 2>/dev/null

echo "--- Preparando Super Payload de Carga (100KB) ---"
DATA=$(head -c 102400 /dev/urandom | base64 | tr -d '\n')

echo "--- Iniciando Super Carga Massiva contra o etcd (5000 objetos) ---"

for i in {1..5000}; do
    # Usando heredoc (cat <<EOF) passamos o dado de forma limpa para a API do ARO
    # Removemos o > /dev/null para que se algo der errado, o erro apareça na tela!
    cat <<EOF | oc apply -f - &
apiVersion: v1
kind: ConfigMap
metadata:
  name: super-obj-$i
  namespace: $NAMESPACE
data:
  payload: "$DATA"
EOF

    # Controle de paralelismo (60 por vez)
    if (( $i % 60 == 0 )); then 
        wait
        echo "Lote de $i de 5000 objetos processado no script..."
    fi
done

wait
echo "--- Super Carga finalizada. Verifique o Dashboard. ---"
