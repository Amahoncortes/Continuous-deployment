# Usar una imagen base de Node para construir el frontend
FROM node:18 AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar package.json y package-lock.json
COPY package.json package-lock.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código fuente
COPY . .

# Construir la aplicación
RUN npm run build

# Usar una imagen más ligera para servir la aplicación
FROM nginx:alpine

# Copiar los archivos generados al directorio de Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Exponer el puerto en el que Nginx servirá la app
EXPOSE 80

# Comando por defecto para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]