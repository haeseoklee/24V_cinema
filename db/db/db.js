var mysql = require('mysql');
var os = require('os');

var connection = mysql.createConnection({
    host : 'localhost',
    port: 3306,
    user : 'root',
    password : 'satigofk12',
    database : '24v_cinema',
});
connection.connect();

module.exports = connection;