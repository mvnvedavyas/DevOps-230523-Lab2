FROM golang:alpine AS build-env
WORKDIR /src
COPY file.go .
RUN CGO_ENABLED=0 GOOS=linux GPARCH=amd64 go build -o app file.go

FROM alpine:latest
COPY --from=build-env /src/app /app/app
RUN chmod +x /app/app
CMD ["/app/app"]