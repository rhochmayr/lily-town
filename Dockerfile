FROM node:18-slim

WORKDIR /usr/src/app

# Install build tools for native modules
RUN apt-get update && \
    apt-get install -y python3 build-essential libssl-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy and install dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps
RUN npx update-browserslist-db@latest

COPY . .

EXPOSE 5173

CMD ["npx", "vite", "--host"]

