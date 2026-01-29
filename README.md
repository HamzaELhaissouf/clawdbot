# Clawdbot Docker Gateway

This project provides a Dockerized environment for running the **Clawdbot Gateway**. It relies on `node:22-slim` and allows you to run the gateway quickly without manual configuration.

## 🚀 Getting Started

### 1. Build the Image
Build the Docker image using the provided Dockerfile. We'll tag it as `clawdbot-gateway`.

```bash
docker build -t clawdbot-gateway .
```

### 2. Run the Container
Run the container, mapping the port `8080` and optionally mounting a volume for persistent data.

```bash
docker run -d \
  -p 8080:8080 \
  --name clawdbot \
  -v $(pwd)/clawdbot-data:/data \
  clawdbot-gateway
```

### 3. Verify
Once running, the gateway will be accessible at:
`http://localhost:8080`

You can view the logs to confirm it started correctly:
```bash
docker logs -f clawdbot
```

## 🛠 Dockerfile Overview

- **Base Image**: `node:22-slim` (Lightweight Node.js environment)
- **Dependencies**: Installs `git` (required for internal dependencies).
- **Installation**: Installs `clawdbot` globally via npm.
- **Port**: Binds to port `8080` on the LAN interface.
- **Mode**: Runs with `--allow-unconfigured` to bypass initial setup blocks.

## 📂 Volume Persistence
The container uses `/data` as the working directory. Mounting a local volume to `/data` ensures that your workspace and configuration persist across restarts.

```bash
-v ./my-data:/data
```
