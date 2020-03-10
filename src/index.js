const { ApolloServer } = require("apollo-server");
const typeDefs = require("./schema");
const resolvers = require("./resolvers");
require("dotenv").config()
const NODE_PORT = process.env.NODE_PORT || 4001;
//const URL = process.env.URL || 'http://localhost:4001';
//const SUBSCRIPTIONS_URL = process.env.SUBSCRIPTIONS_URL || 'ws://localhost:4001/graphql';

const server = new ApolloServer({
  typeDefs,
  resolvers
});

server.listen(NODE_PORT).then(({ url, subscriptionsUrl }) => {
  console.log(`🚀 Server ready at ${url}`);
  console.log(`🚀 Subscriptions ready at ${subscriptionsUrl}`);
});
