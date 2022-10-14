FROM golang:1.18-alpine
WORKDIR /migrations

RUN go install github.com/pressly/goose/v3/cmd/goose@latest

ARG DBHOST
ARG DBUSER
ARG DBPASSWORD
ARG DBNAME

ENV DBSTRING="host=${DBHOST} user=${DBUSER} password=${DBPASSWORD} dbname=${DBNAME} sslmode=disable"

CMD goose postgres "${DBSTRING}" up


