var mysql = require('mysql');

var connection = mysql.createConnection({
    host : 'localhost',
    port: 8888,
    user : 'root',
    password : 'root',
    database : '24V_cinema',
    socketPath :'/Applications/MAMP/tmp/mysql/mysql.sock'
});
connection.connect();

module.exports = connection;