FROM node:10
ENV NODE_PORT 80
ENV HOST graphql.binganetworks.com.br
COPY . /app
WORKDIR /app
RUN npm install
EXPOSE ${NODE_PORT}
ENTRYPOINT [ "node" , "./src/index.js" ]
