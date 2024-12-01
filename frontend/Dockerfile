# Gunakan Node.js image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Salin package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin semua file frontend
COPY . .

# Build React app
RUN npm run build

# Gunakan Nginx untuk serve aplikasi
FROM nginx:alpine

# Salin file konfigurasi Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Salin hasil build React ke direktori Nginx
COPY --from=0 /usr/src/app/build /usr/share/nginx/html

# Expose port frontend
EXPOSE 80

# Jalankan Nginx
CMD ["nginx", "-g", "daemon off;"]
