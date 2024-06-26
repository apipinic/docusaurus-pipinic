FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Check if .npmrc exists and copy it, otherwise ignore
COPY .npmrc .npmrc
RUN if [ -f .npmrc ]; then echo ".npmrc found"; else echo ".npmrc not found"; fi

# Use npm install to install dependencies
RUN npm install --verbose

# Copy the rest of the application source code
COPY . .

# Build the Docusaurus site
RUN npm run build --verbose

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["npx", "docusaurus", "serve", "build", "--port", "3000", "--host", "0.0.0.0"]
