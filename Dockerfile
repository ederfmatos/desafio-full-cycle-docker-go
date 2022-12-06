FROM golang:1.19.4-alpine3.16 as stage
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app

FROM scratch
WORKDIR /build
COPY --from=stage /build/app .
ENTRYPOINT [ "./app" ]