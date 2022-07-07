FROM golang:alpine AS builder
WORKDIR /go/src/app
COPY hello.go .
RUN go mod init
RUN go build -o hello
RUN ls -lah
FROM scratch
COPY --from=builder /go/src/app/hello /
ENTRYPOINT [ "/hello" ]