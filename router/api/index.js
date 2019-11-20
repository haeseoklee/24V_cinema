var express = require('express');
var app = express();
var router = express.Router();
var path = require('path');

router.get('/login', function(req, res){
    var id =  req.user;
    var isAuthenticated = req.isAuthenticated();
    res.json({'id': id, 'isAuthenticated': isAuthenticated});
})

module.exports = router;