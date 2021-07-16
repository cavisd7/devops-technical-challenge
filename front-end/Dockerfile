# Build env
# Get latest version of node.js alpine image 
FROM node:alpine

# Set working directory 
WORKDIR /usr/src/app

# Add binaries to container PATH
# ENV PATH /app/node_modules/.bin:$PATH

COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent

# Copy app
COPY . ./

# Build static assets with Parcel to ./build
RUN npm run build

# Production env
FROM nginx:stable-alpine

# Copy build artifacts to production env to be served by nginx
COPY --from=0 /usr/src/app/build /usr/share/nginx/html

# Expose port 80 on container for web traffic
EXPOSE 80

# Keep nginx in the foreground so docker can track the process
CMD ["nginx", "-g", "daemon off;"]