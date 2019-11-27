var express = require('express');
var router = express.Router();
var path = require('path');
var db = require('../../db/db');

router.get('/', function(req, res){
    //res.render('main.ejs', {resData: resData});
    var sql = 'select * from movie';
    var query = db.query(sql, function(err, rows){
        var hasResult = false ? rows.length === 0 : true;
        var resData = {};
        if (err) return done(err);
        if (hasResult){
            resData.result = rows.length;
            resData.data = JSON.parse(JSON.stringify(rows));
        }
        else {
            resData.result = 0;
            resData.data = null;
        }
        res.render('main.ejs', {resData: resData});
    })   
})

module.exports = router;