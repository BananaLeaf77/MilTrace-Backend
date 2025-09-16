# MilTrace Backend 🚀

This is the **MilTrace Backend**, a Go-based REST API server built with [Gin](https://github.com/gin-gonic/gin).
It was intended to serve as a backend service for tracking devices, handling HTTP requests, and connecting to a PostgreSQL database.

⚠️ **Note:** This project is no longer maintained and **does not currently work**. The code is kept here for reference.
The Hardware (my ESP 32 that suppose to hit these endpoints did not work anymore so idk if this backend still fit for it)

---

## Features

* REST API using **Gin**
* Database connection via custom `config.BootDB()`
* Repository → Service → Delivery (Handler) structure
* Middleware support (CORS, trusted proxies)
* Basic endpoints (example: `/ping` health check)

---

## Project Structure

```
MilTrace/
├── config/        # Database configuration (BootDB)
├── delivery/      # HTTP Handlers (Gin routes)
├── repository/    # Data access layer
├── services/      # Business logic layer
└── main.go        # Entry point
```

---

## Requirements

* Go 1.20+
* PostgreSQL
* (Optional) `.env` file for local environment variables

---

## Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/yourusername/MilTrace.git
cd MilTrace
```

### 2. Set up environment variables

Create a `.env` file in the root (optional for `StartHTTPLocal()`):

```env
DB_NAME=your_db
DB_USER=your_user
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
DB_SSLMODE=disable
ALLOW_ORIGINS=*
```

### 3. Run the server

```bash
go run main.go
```

By default, it will try to start the server on **[http://localhost:8080](http://localhost:8080)**

Health check endpoint:

```
GET http://localhost:8080/ping
```

---

## Notes

* `StartHTTP()` is for production (reads env directly).
* `StartHTTPLocal()` is for local testing with `.env`.
* Database initialization might fail if `config.BootDB()` isn’t properly configured.

---

## Status

❌ **Not working anymore** — this repo is kept only for historical / educational purposes.
✅ You can still use the structure as a starting point for a new Gin + PostgreSQL project.

---
