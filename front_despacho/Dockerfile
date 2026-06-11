# --- ETAPA 1: Compilación del código ---
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
# Cambiado CMD por RUN para que compile de verdad durante el docker build
RUN npm run build

# --- ETAPA 2: Servidor de Producción con Nginx ---
FROM nginx:1.21-alpine

# Copiamos la carpeta compilada (Vite genera 'dist') al directorio de Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copiamos tu archivo de configuración de Nginx si lo tienes
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# Comando único para mantener Nginx corriendo en primer plano
CMD ["nginx", "-g", "daemon off;"]