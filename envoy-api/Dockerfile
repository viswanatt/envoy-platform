# Stage 1: Build dependencies
FROM node:20-alpine AS builder
WORKDIR /app
COPY src/package*.json ./
RUN npm ci --only=production

# Stage 2: Runtime
FROM node:20-alpine
RUN addgroup -S -g 1001 appgroup && adduser -S -u 1001 -G appgroup appuser
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY src/ .
USER 1001
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD ["node", "-e", "require('http').get('http://localhost:3000/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"]
CMD ["node", "index.js"]
