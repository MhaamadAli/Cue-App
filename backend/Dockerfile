FROM node as base
WORKDIR app
COPY ./prisma ./prisma
COPY ./dist ./dist
COPY ./package.json ./package.json
RUN npm i 
RUN npx prisma generate 
CMD ["node","/app/dist/main.js"]
