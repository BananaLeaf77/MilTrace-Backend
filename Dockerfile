# -------- Build Stage --------
FROM golang:1.24 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o server .

# -------- Final Image --------
FROM gcr.io/distroless/base-debian12

COPY --from=builder /app/server /server

EXPOSE 8080

ENTRYPOINT ["/server"]
