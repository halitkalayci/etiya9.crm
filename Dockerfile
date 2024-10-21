FROM node:20 AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build --prod

#http sunucusu ile host
FROM nginx:alpine

COPY --from=build /app/dist/etiya9.crm /usr/share/nginx/html
EXPOSE 80
