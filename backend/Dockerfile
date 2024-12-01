# Gunakan Node.js image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Salin package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin semua file backend
COPY . .

# Expose port backend
EXPOSE 5000

# Jalankan server
CMD ["npm", "start"]
