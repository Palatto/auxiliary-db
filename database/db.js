var mysql = require('mysql');

var db_config = {
    host: 'us-cdbr-iron-east-05.cleardb.net',
    user: 'b74f7cc93f4f22',
    password: '7bd66530',
    database: 'heroku_8266adc43670d0f'
};

var database = mysql.createPool(db_config);
module.exports = database;
