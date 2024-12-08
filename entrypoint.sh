#!/bin/sh
echo "[!] Generating certificate"
openssl req \
    -x509 \
    -newkey ec \
    -pkeyopt ec_paramgen_curve:prime256v1 \
    -sha384 \
    -days $DAYS \
    -nodes \
    -keyout key.pem \
    -out cert.pem \
    -subj "/CN=$CN/OU=$OU/O=$O/L=$L/ST=$ST/C=$C"

echo -e "\n\n[!] Generating dhparam"
openssl dhparam -out dhparam.pem 2048
