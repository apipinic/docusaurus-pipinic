FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy npm configuration file for network settings
COPY .npmrc ./

# Copy package.json and package-lock.json
COPY package*.json ./

# Use npm ci to install dependencies
RUN npm ci --verbose

# Copy the rest of the application source code
COPY . .

# Build the Docusaurus site
RUN npm run build --verbose

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["npx", "docusaurus", "serve", "build", "--port", "3000", "--host", "0.0.0.0"]