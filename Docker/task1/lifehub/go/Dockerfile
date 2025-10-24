
FROM golang:1.22-alpine AS builder
WORKDIR /lifehub/go/

COPY go.mod /lifehub/go/
RUN go mod download


COPY  . /lifehub/go

RUN go build -o main .

FROM alpine:latest

WORKDIR /lifehub/go/

COPY --from=builder /lifehub/go/main .

EXPOSE 8086
CMD ["./main"]