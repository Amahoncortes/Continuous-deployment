# Usar una imagen de Nginx para servir el frontend
FROM nginx:alpine

# Establecer directorio de trabajo
WORKDIR /usr/share/nginx/html

# Copiar los archivos HTML, JS y CSS al contenedor
COPY index.html script.js ./

# Exponer el puerto donde Nginx servirá la app
EXPOSE 80

# No hace falta CMD, Nginx ya lo maneja automáticamente
