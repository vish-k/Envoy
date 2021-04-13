# envoy-ssl

Sample to run envoy with ssl cert generated during container bootup.
run.sh - startup script that generates certs
envoy.yaml - sidecar config that uses certs generated during bootup
lib/app.js - hello world node api. it also uses the same certs but you can run the api without https if you choose to.
data/ - folder where the certs generated during bootup will be placed
logs - folder will be created for app & envoy logs.

### Prerequisites
1. Docker


## Installing

{Pls adjust ports/config if needed}

A step by step series of examples that tell you how to get a development env running

Build docker image
```
docker build -t envoy-ssl-image .
```

Run a container from docker image
```
docker stop envoy-ssl-container
docker rm envoy-ssl-container
docker run --name envoy-ssl-container -d -p 18443:8443 envoy-ssl-image
```

Test the https api
```
curl -k https://localhost:18443
```

Attach to container for inspection if needed
```
docker exec -i -t envoy-ssl-container /bin/ash
```