# build
FROM golang:1.22 as build

ENV GOTOOLCHAIN=auto

WORKDIR /app
COPY . .

RUN go build -o server ./cmd/server

# run
FROM debian:bookworm-slim

WORKDIR /app
COPY --from=build /app/server .

EXPOSE 8080
CMD ["./server"]
