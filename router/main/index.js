var express = require('express');
var router = express.Router();

router.get('/', function(req, res){
    //var id =  req.user;
    //var isAuthenticated = req.isAuthenticated();
    res.render('main.ejs');
})

module.exports = router;