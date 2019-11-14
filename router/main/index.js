var express = require('express');
var app = express();
var router = express.Router();
var path = require('path');

router.get('/', function(req, res){
    //var id =  req.user;
    //var isAuthenticated = req.isAuthenticated();
    res.render('main.ejs');
})

module.exports = router;