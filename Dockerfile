# Use the official Strapi image as the base image
FROM strapi/strapi:latest

# Set the working directory inside the container
WORKDIR /usr/src/api

# Copy your Strapi application code to the container
COPY . .

# Install any additional dependencies required for building
RUN apk --no-cache add git python3 build-base

# Build your Strapi application
RUN npm install
RUN npm run build

# Expose the port your Strapi app will run on
EXPOSE 3003 
# Change the port to avoid collisions
