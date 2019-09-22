const AWS = require('aws-sdk');

if (process.env.NODE_ENV !== 'production') {
  AWS.config.credentials = new AWS.SharedIniFileCredentials({profile: 'personal-user'});
}

const express = require('express');
const { ApolloServer, gql } = require('apollo-server-express');
const cors = require('cors')
const fs = require('fs')
const https = require('https')
const { typeDefs, resolvers, dataSources } = require('schema');

const server = new ApolloServer({
  typeDefs,
  resolvers,
  dataSources
});

const app = express();
app.use(cors())
server.applyMiddleware({ app });

https.createServer({
  key: fs.readFileSync('./server.key'),
  cert: fs.readFileSync('./server.cert')
}, app)
.listen(3000, function () {
  console.log(`🚀 Server ready`)
})
