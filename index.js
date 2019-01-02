const express = require('express');
const fs = require('fs');
const app = express();
const html = fs.readFileSync('index.html').toString();

const url = process.env.QRAPHQL_URL || null;
const URL_PREFIX = process.env.URL_PREFIX ||'https://api.digitransit.fi';

const digitransitUrl = (router) => (url || `${URL_PREFIX}/routing/v1/routers/${router}/index/graphql`)

const config =  {
  'waltti': digitransitUrl('waltti'),
  'hsl': digitransitUrl('hsl'),
  'finland': digitransitUrl('finland'),
  'next-hsl': digitransitUrl('next-hsl')
}

app.use('/graphiql/:router', (req,res)=>{
  const router = req.params.router||'hsl'
  res.send(html.replace("'/graphql'",`'${config[router]}'`));
})

app.listen(8080, function () {
  console.log('started.')
})
