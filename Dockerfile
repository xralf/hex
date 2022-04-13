FROM golang:1.14.2-alpine3.11 as builder
ENV CGO_ENABLED=0
WORKDIR /build
COPY . .
RUN go get github.com/google/wire/cmd/wire
RUN wire github.com/xralf/hex/cmd/app
RUN go build github.com/xralf/hex/cmd/app

FROM alpine:3.11.6
COPY --from=builder /build/app .
CMD "./app"