var mysql = require('mysql');

var connection = mysql.createConnection({
    host : 'localhost',
    port: 8888,
    user : 'root',
    password : 'root',
    database : '24V_cinema',
<<<<<<< HEAD
    socketPath :'/Applications/MAMP/tmp/mysql/mysql.sock'
=======
    socketPath :'/Applications/MAMP/tmp/mysql/mysql.sock',
>>>>>>> 70ddafb44e72510d915f29365a754879d9ddc3ae
});
connection.connect();

module.exports = connection;