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

# Argumento para el entorno
ARG NODE_ENV=development

# Establece la variable de entorno
ENV NODE_ENV=$NODE_ENV

# Construye la aplicación solo en producción
RUN if [ "$NODE_ENV" = "production" ]; then yarn build; fi

# Expone el puerto en el que correrá la aplicación
EXPOSE 3000

# Comando por defecto para ejecutar la aplicación
CMD ["yarn", "dev"]