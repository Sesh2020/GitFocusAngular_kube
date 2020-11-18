FROM node
USER root
RUN npm install
EXPOSE 4202
CMD [ "node", "app.js" ]
