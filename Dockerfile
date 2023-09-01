# # Use the official NGINX image
# FROM nginx:latest

# # Copy your custom index.html file to the appropriate directory
# COPY index.html /usr/share/nginx/html/

# # Expose the default NGINX port
# EXPOSE 80

# # Set an environment variable to hold the pod name
# ENV POD_NAME=my-pod

# # Start NGINX and configure it to display the pod name in the index.html file
# CMD sed -i "s/PodNamePlaceholder/$POD_NAME/g" /usr/share/nginx/html/index.html && nginx -g 'daemon off;'

# Use the Node.js 18 base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy the index.html to the container
# COPY index.html /app/

# Copy the server.js to the container
COPY server.js /app/

# Install any dependencies if needed
# RUN npm install

# Expose port 80
EXPOSE 80

# Start the Node.js server
CMD ["node", "server.js"]