# envoy-unix-socket

Unix Sockets aka [Unix Domain Sockets](https://en.wikipedia.org/wiki/Unix_domain_socket "Unix Domain Socket wiki") are used for inter-process communication (IPC) on the same host. Unix sockets utilize OS kernel for data exchange.

TCP/IP sockets are used for communication across the network. Often, TCP/IP sockets are used for facilitating communication between two processes running on the same host. Using TCP/IP sockets, on same host or across network, involves entire network stack & associated APIs/protocols. Consequently, using TCP/IP sockets, for communication between processes on same hosts has some overheads compared to using Unix Sockets.

When using sidecar, like Envoy, with upstream instance of microservice, it is often beneficial to use Unix Socket instead of TCP/IP socket.

This project demonstrates using Unix Domain Socket to communicate between Envoy Sidecar & upstream service.

* _envoy.yaml_ - sidecar config.
* _lib/app.js_ - hello world node api.

_Note: Generally the unix sockets are faster than tcp/ip sockets, please benchmark your specific app before switching to unix sockets as you ay see different results for your app specific payloads/patterns_

## Prerequisites
1. Docker


## Installing

{Pls adjust ports/config if needed}

A step by step series of examples that tell you how to get a development env running

Build docker image
```
docker build -t envoy-unix-socket-image .
```

Run a container from docker image
```
docker stop envoy-unix-socket-container
docker rm envoy-unix-socket-container
docker run --name envoy-unix-socket-container -d -p 18443:8443 envoy-unix-socket-image
```

Test the https api
```
curl -k https://localhost:18443
```

Attach to container for inspection if needed
```
docker exec -i -t envoy-unix-socket-container /bin/ash
```