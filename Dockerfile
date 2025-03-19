# Use a lightweight web server image
FROM nginx:latest

# Copy Netflix clone files into Nginx's web directory
COPY . /usr/share/nginx/html

# Expose the default HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

