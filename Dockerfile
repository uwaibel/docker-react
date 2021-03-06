#BUILD Phase
#alles von hier ab wird mit dem Namen _builder_ referenzier
FROM node:alpine 

WORKDIR '/app'

COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build

#RUN phase
FROM nginx
#hier für AWS Elastic beanstalk um Port 80 nach außen zu geben
EXPOSE 80

COPY --from=0 /app/build /usr/share/ngnix/html


