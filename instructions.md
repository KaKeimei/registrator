ARM64: 
`docker build --build-arg opts="GOARCH=arm64" --pull -t niklaskhf/registrator:arm64 .`

AMD64:
`docker build --build-arg opts="CGO_ENABLED=0 GOARCH=amd64" --pull -t niklaskhf/registrator:amd64 .`