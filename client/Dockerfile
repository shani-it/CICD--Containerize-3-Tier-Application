
# Stage 1: Build React App
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./

# Increase npm timeout and retry attempts
RUN npm config set fetch-retries 5 && \
    npm config set fetch-retry-mintimeout 20000 && \
    npm config set fetch-retry-maxtimeout 120000 && \
    npm config set fetch-timeout 600000

RUN npm install --no-audit --no-fund

COPY . .

ENV CI=false

RUN npm run build

# Stage 2: Nginx
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

