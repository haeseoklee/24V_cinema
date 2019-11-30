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
    // console.log(req.body)
    var reqData = {};
    var str = new String;
    for(var id in req.body)
        str += "id="+id + " or "
    str = str.slice(0,-3);
    // console.log(str)
    
    var sql = 'select name,id,price from menu where '+str;
    var query = db.query(sql, function(err, rows){
        var hasResult = false ? rows.length === 0 : true;
        if (err) return done(err);
        if (hasResult){
            reqData.result = rows.length;
            reqData.data = JSON.parse(JSON.stringify(rows));
            // console.log(reqData.data)
        }
        else {
            reqData.result = 0;
            reqData.data = null;
        }
        res.json({reqData : reqData});
    })
    
    
    // JSON.parse();
    
    
    
    
    // res.json({});
})

module.exports = router;