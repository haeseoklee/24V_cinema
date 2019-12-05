var express = require('express');
var router = express.Router();
var db = require('../../db/db');

router.get('/', function(req, res){
    var sql = 'select * from menu';
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
        res.render('market.ejs', {resData: resData});
    })
});

router.post('/',function(req, res){
    var resData = {}
    resData.resArr = []
    if (req.isAuthenticated()){
        var sql = 'select name, id, price from menu where id=?';
        var arr = req.body.arr;
        arr.forEach(function(element, index){
            var query = db.query(sql, [element.id], function(err, rows){
                if (err) return done(err);
                else{
                    var menu = JSON.parse(JSON.stringify(rows))[0];
                    menu.value = element.value
                }
                resData.resArr.push(menu)  
                if (index === arr.length-1){
                    res.json({resData : resData});
                }
            })
        })
    }else{
        res.json({resData : resData});
    }
});

module.exports = router;