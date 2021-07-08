FROM node:carbon

# Create app directory
WORKDIR /app

# Install app dependencies
RUN npm -g install serve
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . /app
#Build react/vue/angular bundle static files
#RUN npm run generate
RUN npm run build

EXPOSE 8080
# serve build folder on port 8080
CMD ["serve", "-s", "build", "-p", "8080"]
