FROM golang:1.9.4-alpine3.7 AS builder
ARG opts
WORKDIR /go/src/github.com/gliderlabs/registrator/
COPY . .
RUN apk add --no-cache curl git
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh 
RUN dep ensure -vendor-only 
RUN env ${opts} go build \
		-a -installsuffix cgo \
		-ldflags "-X main.Version=$(cat VERSION)" \
		-o bin/registrator \
		.

FROM alpine:3.7
RUN apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/gliderlabs/registrator/bin/registrator /bin/registrator

ENTRYPOINT ["/bin/registrator"]
