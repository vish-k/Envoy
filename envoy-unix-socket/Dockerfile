FROM envoyproxy/envoy-alpine:v1.15.0

# For prod app set this to proper app directory
WORKDIR /

COPY . .

RUN apk update \
    && cd /root \
    && apk upgrade \
    && apk add --update wget gcc gzip tar libc-dev ca-certificates perl make coreutils gnupg linux-headers zlib-dev openssl \
    && apk add --update npm=12.22.1-r0 \ 
    && node -v && npm -v && node -p process.versions.openssl \
    && cd / \
    && npm ci --only=production

EXPOSE 8443

ENTRYPOINT ["sh","/bin/run.sh"]
