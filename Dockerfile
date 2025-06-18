# Estágio de Build
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build # Comando para transpilar seu TypeScript para JavaScript

# Estágio de Produção
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY --from=builder /app/dist ./dist # Copia o JS transpilado
CMD ["node", "dist/server.js"] # Adapte para o seu arquivo de entrada
