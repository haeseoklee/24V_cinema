var mysql = require('mysql');

var connection = mysql.createConnection({
    host : 'localhost',
    port: 3306,
    user : 'root',
    password : 'satigofk12',
    database : '24V_cinema'
});
connection.connect();

module.exports = connection;