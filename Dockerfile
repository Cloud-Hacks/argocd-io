# Use a minimal base image
FROM nginx:alpine

# Expose port 80
EXPOSE 80

# Start nginx (default command already provided by the base image)
CMD ["nginx", "-g", "daemon off;"]