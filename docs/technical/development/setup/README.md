# Development Environment Setup

## Prerequisites
- Docker & Docker Compose
- Node.js 18+
- pnpm
- Git
- Visual Studio Code (recommended)

## Initial Setup

1. Clone Repositories
```bash
./clone-repositories.sh
```

2. Configure Environment
```bash
# Copy environment files
cp .env.example .env

# Install dependencies
pnpm install
```

3. Start Development Environment
```bash
# Start all services
docker-compose up -d

# Start specific service
docker-compose up auth -d
```

## Docker Development Environment

### Service Configuration
Each service has its own Dockerfile and docker-compose configuration:

```dockerfile
# Example Dockerfile for services
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

CMD ["npm", "run", "dev"]
```

### Local Development Workflow
1. Start required services
2. Make code changes
3. Services hot-reload automatically
4. Run tests in containers

### Database Management
- Local PostgreSQL instance
- Automated migrations
- Seeding test data

### Debugging
- VS Code Docker integration
- Remote debugging
- Container logs
