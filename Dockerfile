# Usa la imagen base de Node.js
FROM node:20.12.2-alpine

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo package.json y yarn.lock al contenedor
COPY package.json ./
COPY yarn.lock ./

# Instala las dependencias del proyecto
RUN yarn install

# Copia todo el código fuente al contenedor
COPY . .

# Construye la aplicación solo en producción
RUN yarn build

# Expone el puerto en el que correrá la aplicación
EXPOSE 3000

# Comando por defecto para ejecutar la aplicación
CMD ["yarn", "build"]

# # Stage 1: Build Stage
# FROM node:20.12.2-alpine AS build

# # Set working directory
# WORKDIR /app

# # Install dependencies
# COPY package*.json ./
# RUN npm install

# # Copy all files
# COPY . .

# # Build the Vue.js application
# RUN npm run build

# # Stage 2: Production Stage
# FROM node:20.12.2-alpine AS production

# # Set working directory
# WORKDIR /app

# # Install serve package globally
# RUN npm install -g serve

# # Copy the build output from the build stage
# COPY --from=build /app/dist /app/dist

# # Expose port 5000
# EXPOSE 8080

# # Command to serve the application
# CMD ["serve", "-s", "dist", "-l", "8080"]

# # Stage 3: Development and Testing Stage
# FROM node:20.12.2-alpine AS dev

# # Set working directory
# WORKDIR /app

# # Install dependencies
# COPY package*.json ./
# RUN npm install

# # Copy all files
# COPY . .

# # Expose port for development server
# EXPOSE 8080

# # Default command for development
# CMD ["yarn", "build"]
# # 