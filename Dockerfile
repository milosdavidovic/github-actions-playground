FROM node:18-alpine AS build

WORKDIR /app

COPY . .

RUN ls -la

RUN npm -v
RUN npm i
RUN npm run build

FROM ubuntu

RUN apt-get update
RUN apt-get install nginx -y

COPY --from=build /app/dist /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]



