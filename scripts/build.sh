#!/usr/bin/env bash

cd "$(dirname "$0")/.." || exit

# Recompile protobuf specification
protoc --go_out=pkg --go_opt=paths=source_relative \
    --go-grpc_out=pkg --go-grpc_opt=paths=source_relative \
    adapter/adapter.proto

# Compile client
go build `go list ./... | grep -v 'vendor'`

