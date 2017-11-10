var express = require("express");
var app = express();
var database = require('./db.js');
app.use(express.logger()); //see this

app.get('/', function(request, response) {
  response.send("Let's go!!!");
});

app.get('/users', function(request, response) {
  database.getConnection(function(err, connection) {
    if (err) { console.log('error: ', err); throw err; }
  	connection.query('SELECT * from users', function(err, rows, fields) {
      if (err) { console.log('error: ', err); throw err; }
      response.send(rows);
  	});
  	//console.log(database._freeConnections.indexOf(connection)); // changes from -1 to 0 - log information to heroku
  	connection.release();
  });
});

var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log("Listening on " + port);
});
