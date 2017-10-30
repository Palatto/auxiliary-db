var express = require("express");
var app = express();
var db = require('./db.js');
app.use(express.logger()); //see this

app.get('/', function(request, response) {
  response.send("Let's go!!!");
});

app.get('/users', function(request, response) {
  db.query('SELECT * from users', function(err, rows, fields) {
    if (err) {
      console.log('error: ', err);
      throw err;
    }
    response.send(rows);
  });
});

var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log("Listening on " + port);
});
