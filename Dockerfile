# Enable BuildKit for better caching and parallelism
# syntax=docker/dockerfile:1.3-labs

# Use multi-stage builds to cache dependencies
FROM node:20 AS build

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Check if .npmrc exists and copy it, otherwise ignore
COPY .npmrc .npmrc

# Use cache to speed up npm install
RUN --mount=type=cache,target=/root/.npm \
    if [ -f package-lock.json ]; then npm ci --verbose; else npm install --verbose; fi

# Verify Docusaurus installation
RUN npx docusaurus --version || echo "Docusaurus not installed"

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

# Ensure all necessary source and config files are copied
COPY --from=build /usr/src/app/docusaurus.config.js /usr/src/app/docusaurus.config.js
COPY --from=build /usr/src/app/sidebars.js /usr/src/app/sidebars.js
COPY --from=build /usr/src/app/src /usr/src/app/src
COPY --from=build /usr/src/app/static /usr/src/app/static

# Expose the port the app runs on
EXPOSE 3000

# Debug: List contents of /usr/src/app directory
RUN ls -la /usr/src/app

# Command to run the app
CMD ["npx", "docusaurus", "serve", "--port", "3000", "--host", "0.0.0.0"]
