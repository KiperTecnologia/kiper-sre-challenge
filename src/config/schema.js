const { ApolloServer } = require("apollo-server-express");

const TYPEDEFS = require("../schema");
const RESOLVERS = require("../resolvers");

const SERVER = new ApolloServer({
  typeDefs: TYPEDEFS,
  resolvers: RESOLVERS,
  playground: {
    endpoint: `http://localhost:4000/graphql`
  }
});

// Exports
module.exports = SERVER;
