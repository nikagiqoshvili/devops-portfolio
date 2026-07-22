# Dockerized Nginx Web Application

This is the first project in my DevOps portfolio.

The project runs a static website inside an Nginx Docker container and
uses Docker Compose to manage the application.

## Technologies

- Rocky Linux
- Docker
- Docker Compose
- Nginx
- HTML
- Git

## Architecture

Browser → Host port 8080 → Docker container port 80 → Nginx

## Project Structure

```text
.
├── compose.yaml
├── Dockerfile
├── html
│   └── index.html
└── README.md
