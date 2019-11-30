var express = require('express');
var router = express.Router();
var db = require('../../db/db');

router.get('/', function(req, res){
    isLogin(req, res, function(){
        var sql = 'select * from movie';
        var query = db.query(sql, function(err, rows){
            var hasResult = false ? rows.length === 0 : true;
            var resData = {};
            if (err) return done(err);
            if (hasResult){
                resData.result = rows.length;
                resData.movie = JSON.parse(JSON.stringify(rows));
                var sql = 'select * from cinema';
                var query = db.query(sql, function(err, rows){
                    var hasResult = false ? rows.length === 0 : true;
                    if (err) return done(err);
                    if (hasResult){
                        resData.result = rows.length;
                        resData.cinema = JSON.parse(JSON.stringify(rows));
                    }
                    else{
                        resData.result = 0;
                        resData.cinema = null;
                    }
                })
            }
            else {
                resData.result = 0;
                resData.movie = null;
            }
            res.render('book.ejs', {resData: resData});
        })
    })
    

});




function isLogin(req, res, fn){
    if (req.isAuthenticated()) {
        return fn();
    }else {
        res.redirect('/user/login');
    }
}

module.exports = router;
