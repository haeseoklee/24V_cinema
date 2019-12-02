var express = require('express');
var app = express();
var router = express.Router();
var path = require('path');

router.get('/', function(req, res){
    console.log(req.query)
    res.render('payment.ejs', {});
});

module.exports = router;