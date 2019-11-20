var express = require('express');
var router = express.Router();
var db = require('../../db/db');

router.get('/', function(req, res){
    //var id =  req.user;
    //var isAuthenticated = req.isAuthenticated();
    res.json({'test':'test'});
})

module.exports = router;