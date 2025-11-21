FROM nginx:stable-alpine

# Copy the static site files
COPY dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
