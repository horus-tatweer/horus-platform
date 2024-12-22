# Service Deployment Guide

## Prerequisites
Required tools and access.

## Environment Setup
```bash
# Environment variables
export SERVICE_NAME=example
export ENV=production
```

## Deployment Steps

### 1. Build
```bash
docker build -t service:version .
```

### 2. Configuration
```yaml
# Configuration example
service:
  replicas: 3
  resources:
    limits:
      cpu: 1
      memory: 1Gi
```

### 3. Deploy
```bash
kubectl apply -f deployment.yaml
```

## Verification
Steps to verify deployment.

## Rollback Procedure
Steps for rollback if needed.

## Monitoring
Monitoring setup and dashboards.

## Troubleshooting
Common issues and solutions.
