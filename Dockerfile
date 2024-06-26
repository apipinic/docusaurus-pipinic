# Use multi-stage builds to cache dependencies
FROM node:18 AS build

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Check if .npmrc exists and copy it, otherwise ignore
COPY .npmrc .npmrc
RUN if [ -f .npmrc ]; then echo ".npmrc found"; else echo ".npmrc not found"; fi

# Clean npm cache and install dependencies with retries
RUN npm cache clean --force && \
    npm ci --verbose || cat /root/.npm/_logs/*-debug-*.log

# Copy the rest of the application source code
COPY . .

# Build the Docusaurus site
RUN npm run build --verbose

# Stage 2: Setup the final image
FROM node:18

WORKDIR /usr/src/app

# Copy built files from the build stage
COPY --from=build /usr/src/app/build /usr/src/app/build
COPY --from=build /usr/src/app/node_modules /usr/src/app/node_modules

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["npx", "docusaurus", "serve", "build", "--port", "3000", "--host", "0.0.0.0"]
