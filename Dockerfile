FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Clean npm cache and install dependencies without optional ones
RUN npm cache clean --force
RUN npm install --no-optional --verbose

# Bundle app source
COPY . .

# Build the Docusaurus site
RUN npm run build --verbose

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["npx", "docusaurus", "serve", "build", "--port", "3000", "--host", "0.0.0.0"]
