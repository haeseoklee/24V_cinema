var mysql = require('mysql');
var os = require('os');

var socketPath = function() {
    if (os.platform() === 'darwin') {
        return '/Applications/MAMP/tmp/mysql/mysql.sock';
    }
    if (os.platform() === 'win32') {
        return '';
    }
}

var connection = mysql.createConnection({
    host : 'localhost',
    port: 8888,
    user : 'root',
    password : 'root',
    database : '24V_cinema',
    socketPath : socketPath(),
});
connection.connect();

module.exports = connection;