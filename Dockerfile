
FROM golang:1.20-alpine as builder
ARG GUM_VERSION

RUN go install github.com/charmbracelet/gum@v${GUM_VERSION}

FROM alpine:3.17

COPY --from=builder /go/bin/gum /usr/local/bin/gum

ENTRYPOINT [ "gum" ]
