# ==============================================================================
# Use Case: Multi-stage Docker Build for a Web Application
# Description: Demonstrates containerizing a Node.js application using 
#              multi-stage builds to keep the final image size minimal and secure.
# 
# Explanation: This file is part of the Docker suite. It provides a standardized template for Dockerfile to maintain infrastructure and application reliability.
# 
# How to Use:
# Run 'docker build -t dockerfile-app -f Dockerfile .' to build the image locally.
# ==============================================================================

# Stage 1: Build environment
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Production environment
FROM node:18-alpine AS production
WORKDIR /app
ENV NODE_ENV=production
# Copy only production dependencies and built assets
COPY package*.json ./
RUN npm ci --only=production
COPY --from=builder /app/dist ./dist

# Run as non-root user for security
USER node
EXPOSE 3000

CMD ["node", "dist/main.js"]
