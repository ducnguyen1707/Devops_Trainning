FROM node:20-alpine

WORKDIR /lifehub_v2/react

COPY package.json ./

RUN npm install

COPY . /lifehub_v2/react/app/src


EXPOSE 5173

CMD ["npm", "run", "dev"]