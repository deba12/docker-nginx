FROM debian:buster-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install -y \
      nginx-extras \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/* \
    && DEBIAN_FRONTEND=noninteractive apt-get remove --purge --auto-remove -y

COPY openssl.cnf /etc/ssl/openssl.cnf

VOLUME /etc/nginx
VOLUME /run/php

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
