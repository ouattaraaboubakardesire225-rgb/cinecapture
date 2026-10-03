# Étape 1 : Image de base Node.js
FROM node:22-bookworm-slim

WORKDIR /app

# Copie des fichiers de dépendances npm
COPY package.json package-lock.json* ./

# Installation des dépendances avec npm
RUN npm install

# Copie de l'intégralité du projet
COPY . .

# Compilation de l'application
RUN npm run build --if-present

# Variables d'environnement
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Lancement de l'application
CMD ["node", "dist/index.js"]



