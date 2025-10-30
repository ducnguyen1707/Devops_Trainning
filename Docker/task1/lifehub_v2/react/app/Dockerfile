# Use official Node.js LTS image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Expose Vite's default port
EXPOSE 5173

# Set environment variable for Vite


# Run the development server
CMD ["npm", "run", "dev"]
