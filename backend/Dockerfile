FROM node as base
WORKDIR app
COPY ./dist ./dist
COPY ./package.json ./package.json
RUN npm i 
CMD ["node","/app/dist/main.js"]