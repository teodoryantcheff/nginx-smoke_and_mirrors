#FROM nginx:1.15.8
FROM nginx:latest

EXPOSE 80
#CMD "ls /usr/share/nginx/html"
CMD ["nginx", "-g", "daemon off;"]


