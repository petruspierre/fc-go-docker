FROM golang:1.19-buster as builder

WORKDIR /usr/app

COPY . .

RUN go build .

FROM alpine:3.16

COPY --from=builder /usr/app/hello .

ENTRYPOINT [ "./hello" ]