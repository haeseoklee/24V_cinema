var express = require('express');
var router = express.Router();
var db = require('../../db/db');

router.get('/', function(req, res){
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
        res.render('movie.ejs', {resData: resData});
    }) 
});

router.get('/:id', function(req,res){
    var sql = 'select * from movie where id='+req.params.id+';';
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
        res.render('movieInfo.ejs', {resData: resData});
    })
})

module.exports = router;