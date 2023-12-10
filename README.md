# Docker Secret Demo
> A more secure way to pass sensitive information to a Docker image at build time. Note, this are **not** Swarm Secrets

## Requirements
- make
- docker

## Usage
Run `make run` to build and run the Docker image. The go app will print both secure and insecure secrets to console. \
Check `docker history dockersecretdemo`:
```shell
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
507a2a7ab64d   18 seconds ago   RUN |1 INSECURE_PASS=superInsecurePass123 /b…   4.1kB     buildkit.dockerfile.v0
<missing>      18 seconds ago   RUN |1 INSECURE_PASS=superInsecurePass123 /b…   29.4MB    buildkit.dockerfile.v0
<missing>      18 seconds ago   ENV INSECURE_PASS=superInsecurePass123          0B        buildkit.dockerfile.v0
<missing>      18 seconds ago   ARG INSECURE_PASS                               0B        buildkit.dockerfile.v0
<missing>      21 seconds ago   COPY . . # buildkit                             28.7kB    buildkit.dockerfile.v0
<missing>      2 hours ago      RUN /bin/sh -c go mod download # buildkit       4.1kB     buildkit.dockerfile.v0
<missing>      2 hours ago      COPY go.mod go.sum* ./ # buildkit               12.3kB    buildkit.dockerfile.v0
<missing>      2 hours ago      WORKDIR /app                                    8.19kB    buildkit.dockerfile.v0
<missing>      32 hours ago     /bin/sh -c #(nop) WORKDIR /go                   0B        
<missing>      32 hours ago     /bin/sh -c mkdir -p "$GOPATH/src" "$GOPATH/b…   16.4kB    
<missing>      32 hours ago     /bin/sh -c #(nop)  ENV PATH=/go/bin:/usr/loc…   0B        
<missing>      32 hours ago     /bin/sh -c #(nop)  ENV GOPATH=/go               0B        
<missing>      32 hours ago     /bin/sh -c #(nop)  ENV GOTOOLCHAIN=local        0B        
<missing>      32 hours ago     /bin/sh -c set -eux;  apk add --no-cache --v…   254MB     
<missing>      32 hours ago     /bin/sh -c #(nop)  ENV GOLANG_VERSION=1.21.5    0B        
<missing>      32 hours ago     /bin/sh -c #(nop)  ENV PATH=/usr/local/go/bi…   0B        
<missing>      32 hours ago     /bin/sh -c apk add --no-cache ca-certificates   1.52MB    
<missing>      2 days ago       /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      2 days ago       /bin/sh -c #(nop) ADD file:8182c73f869a899cf…   8.42MB    
```
Insecure argument passed using `--build-arg` is visible in the history.  (lines 2, 3, 4) \