FROM golang:1.22-alpine AS builder

WORKDIR /lifehub_v2/go 

COPY go.mod ./

RUN go mod download

COPY ./src ./src

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o lifehub_v2 ./src/app.go

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /lifehub_v2/go .


ENTRYPOINT [ "./lifehub_v2" ]