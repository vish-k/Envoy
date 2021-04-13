'use strict';
const { Console } = require('console');
var express = require('express');
var fs = require('fs');
var https = require('https');
var app = express();
var server = https.createServer({
  key: fs.readFileSync(__dirname + '/../data/key.pem'),
  cert: fs.readFileSync(__dirname + '/../data/cert.pem')
}, app);

app.get('/', function (req, res) {
  setTimeout((() => {
    res.json({ msg: 'Hello World over https' });
  }), 500); //add synthetic delay in milliseconds
});

server.listen('/var/tmp/https.sock', function () {
  console.log('My https API listening on unix socket /var/tmp/https.sock');
});
