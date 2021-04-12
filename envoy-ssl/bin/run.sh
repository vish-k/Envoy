#!/bin/ash
echo "Starting run.sh"
apk update && \
apk add ca-certificates openssl && \
rm -rf /var/cache/apk/* /tmp/*

# Write random data to /.rnd which is used to generate private key
openssl rand -writerand $HOME.rnd

# Generating signing SSL private key
openssl genrsa -des3 -passout pass:xxxxx -out key.pem.orig 2048

# Removing passphrase from private key
openssl rsa -passin pass:xxxxx -in key.pem.orig -out key.pem

# Generating certificate signing request
openssl req -new -key key.pem -out cert.csr -subj "/C=US/ST=GA/L=Alpharetta/O=Vish/OU=POC/CN=localhost.ssl"

# Generating self-signed certificate
openssl x509 -req -days 365 -in cert.csr -signkey key.pem -out cert.pem

echo "After generating certs"

mv *.pem /data/
rm key.pem.orig cert.csr
echo "Copying certs to /data"
cp /data/*.pem /usr/local/share/ca-certificates/
update-ca-certificates

echo "127.0.0.1		localhost.ssl" >> /etc/hosts # add localhost.ssl as loopback addr
echo "Creating log folder"
mkdir /logs
echo "Starting Node"
node /lib/app.js > /logs/app.log 2>&1 & #redirect logs to app.log
echo "Starting Envoy"
/usr/local/bin/envoy -c envoy.yaml --service-cluster my-https-api --log-path /logs/envoy.log --log-level error
