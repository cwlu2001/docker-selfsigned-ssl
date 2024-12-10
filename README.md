# docker-selfsigned-ssl
![ci] ![docker_pulls] ![docker_image_size]

[ci]: https://github.com/cwlu2001/docker-build/actions/workflows/selfsigned-ssl.yml/badge.svg
[docker_pulls]: https://img.shields.io/docker/pulls/cwlu2001/selfsigned-ssl?logo=docker
[docker_image_size]: https://img.shields.io/docker/image-size/cwlu2001/selfsigned-ssl?logo=docker

A selfsigned ssl generator

## Run
### CLI
```bash
docker run -v ./certs:/certs --rm cwlu2001/selfsigned-ssl
```
Will generate a certificate with `prime256v1` elliptic curve, valid for `365` days, in  `certs/`

## Config
### Valid days
Valid for 10 years
```bash
docker run -e DAYS=3650 -v ./certs:/certs --rm cwlu2001/selfsigned-ssl
```

### Subject
1. Create `.env` file
    ```
    DAYS=365
    CN=example.site
    OU=
    O=
    L=
    ST=
    C=
    ```
2. Pass `.env` into container
    ```bash
    docker run --env-file ./.env -v ./certs:/certs --rm cwlu2001/selfsigned-ssl
    ```
