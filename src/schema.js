const { gql } = require("apollo-server");

const typeDefs = gql`
  type BrandType {
    id: Int
    name: String!
    key: String
   
  }

  type SuccessType {
    success: Boolean!
  }

  type Query {
    allBrands: [BrandType!]!
  }
  type Mutation {
    createBrand(name: String): BrandType!
  }
  type Subscription {
    brandAdded: SuccessType!
  }
`;

module.exports = typeDefs;
