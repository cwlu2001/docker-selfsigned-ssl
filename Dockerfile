FROM alpine:3.21
RUN \
  apk add --no-cache \
    openssl
WORKDIR /certs
COPY --chmod=777 entrypoint.sh /entrypoint.sh
CMD [ "/entrypoint.sh" ]
