# Étape 1 : Image de base Node.js
FROM node:22-bookworm-slim

WORKDIR /app

# Activer et préparer pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copie uniquement des fichiers de configuration indispensables
COPY package.json pnpm-lock.yaml ./

# Installation des dépendances sans bloquer sur le verrouillage stricts
RUN pnpm install --no-frozen-lockfile

# Copie du reste des fichiers de l'application
COPY . .

# Build du projet
RUN pnpm build

# Variables d'environnement pour la production
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Lancement de l'application
CMD ["node", "dist/index.js"]


