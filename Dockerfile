# Use the official Strapi image as the base image
FROM strapi/strapi:latest
# Installing libvips-dev for sharp Compatibility
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/
COPY package.json package-lock.json ./
RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install
ENV PATH /opt/node_modules/.bin:$PATH

WORKDIR /opt/app
COPY . .
RUN ["npm", "run", "build"]
EXPOSE 3001
CMD ["npm", "run", "develop"]