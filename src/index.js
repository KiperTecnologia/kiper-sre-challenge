const { ApolloServer } = require("apollo-server");
const typeDefs = require("./schema");
const resolvers = require("./resolvers");
require("dotenv").config()

const server = new ApolloServer({
  typeDefs,
  resolvers
});

server.listen(4001).then(({ url, subscriptionsUrl }) => {
  console.log(`🚀 Server ready at ${url}`);
  console.log(`🚀 Subscriptions ready at ${subscriptionsUrl}`);
});
