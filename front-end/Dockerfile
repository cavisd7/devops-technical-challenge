# Build env
# Get latest version of node.js alpine image 
FROM node:alpine

# Set working directory 
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Ensure clean install of dependencies 
RUN npm ci --silent

# Copy app
COPY . ./

# Build static assets with Parcel to ./build
RUN npm run build

# Production env
# Get latest version of nginx stable alpine image 
FROM nginx:stable-alpine

# Copy build artifacts to production env to be served by nginx
COPY --from=0 /usr/src/app/build /usr/share/nginx/html

# Expose port 80 on container for web traffic
EXPOSE 80

# Start nginx and keep in the foreground so docker can track the process
CMD ["nginx", "-g", "daemon off;"]