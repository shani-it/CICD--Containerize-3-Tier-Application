# Base image Node.js ki use karenge
FROM node:18

# Container ke andar working directory set karna
WORKDIR /app

# Dependencies install karne ke liye pehle package.json copy karna
COPY package*.json ./
RUN npm install

# Baaki saara backend code copy karna
COPY . .

# Backend ka port expose karna (aam tor par Express apps 4000 ya 5000 par chalti hain)
EXPOSE 4000

# Server start karne ki command
CMD ["node", "index.js"]
