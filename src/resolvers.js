
const BRAND_ADDED = "BRAND_ADDED";
const pubsub = require("./pubsub")
const axios = require("axios")
require("dotenv").config()


const resolvers = {
  Query: {
   async allBrands(){
      const req = await axios.get("https://fipeapi.appspot.com/api/1/carros/marcas.json");
      return req.data;
    }
  },

  Mutation: {
    async createBrand(root,args){
      pubsub.publish(BRAND_ADDED, { success: true});
      return {
        name: args.name
      }
    }
  },
 
  Subscription: {
    brandAdded: {
      subscribe: () => pubsub.asyncIterator([BRAND_ADDED]),
      resolve: (payload) => {
        return payload;
      },
    },
   
  }
};

module.exports = resolvers;
