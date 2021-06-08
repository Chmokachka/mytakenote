# Use small Alpine Linux image
FROM node:12-alpine

# Set environment variables
ENV PORT=5000
ARG CLIENT_ID=79ccc48a450cd4e391a8

COPY . app/

WORKDIR app/

# Make sure dependencies exist for Webpack loaders
RUN apk add --no-cache \
  autoconf \
  automake \
  bash \
  g++ \
  libc6-compat \
  libjpeg-turbo-dev \
  libpng-dev \
  make \
  nasm
# Run tests
RUN npm run test


# RUN npm ci --only-production --silent


# Build production client side React application
# RUN npm run build

# Run tests
# RUN npm run test

# Expose port for Node
# EXPOSE $PORT

# Start Node server
# ENTRYPOINT npm run prod
