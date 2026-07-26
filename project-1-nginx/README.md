## Architecture
![CI Pipeline](https://github.com/nikagiqoshvili-debug/devops-portfolio/actions/workflows/ci.yaml/badge.svg)
```text
Client
  |
  v
Nginx container
  |
  v
Python Flask API container
  |
  v
PostgreSQL container
  |
  v
Docker named volume
