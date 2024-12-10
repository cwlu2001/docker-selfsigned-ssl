#!/bin/sh
DAYS=${DAYS:-365}
CN=${CN:-example.site}
SUBJ="/CN=$CN"

if [ -n "${OU}" ]; then
    SUBJ="$SUBJ/OU=$OU"
fi
if [ -n "${O}" ]; then
    SUBJ="$SUBJ/O=$O"
fi
if [ -n "${L}" ]; then
    SUBJ="$SUBJ/L=$L"
fi
if [ -n "${ST}" ]; then
    SUBJ="$SUBJ/ST=$ST"
fi
if [ -n "${C}" ]; then
    SUBJ="$SUBJ/C=$C"
fi

echo "[!] Generating certificate"
echo "The subject is: $SUBJ"
openssl req \
    -x509 \
    -newkey ec \
    -pkeyopt ec_paramgen_curve:prime256v1 \
    -sha384 \
    -days $DAYS \
    -nodes \
    -keyout key.pem \
    -out cert.pem \
    -subj $SUBJ
