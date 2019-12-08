var express = require('express');
var router = express.Router();
var db = require('../../db/db');

router.get('/', function(req, res){
    isLogin(req, res, function(){
        var sql = 'select * from menu';
        var query = db.query(sql, function(err, rows){
            var hasResult = false ? rows.length === 0 : true;
            var resData = {};
            if (err) return done(err);
            else{
                resData.result = rows.length;
                resData.menu = JSON.parse(JSON.stringify(rows));
                var sql = 'select * from cinema';
                var query = db.query(sql, function(err, rows){
                    var hasResult = false ? rows.length === 0 : true;
                    if (err) return done(err);
                    else{
                        resData.result = rows.length;
                        resData.cinema = JSON.parse(JSON.stringify(rows));
                    }
                    res.render('market.ejs', {resData: resData});
                })
            }
        })
    })
    
});

router.post('/',function(req, res){
    var resData = {}
    resData.resArr = []
    if (req.isAuthenticated()){

        var sql = 'insert into orderlist set ?';
        var data = {
            customer_id: req.user,
            cinema: req.body.cinemaChecked
        }
        var orderlist_id = 0;
        var origin_pay = 0;
        var query = db.query(sql, data, function(err, rows){
            if(err) throw err
            else{
                orderlist_id = rows.insertId;
                var sql = 'select name, id, price from menu where id=?';
                var arr = req.body.arr;
                arr.forEach(function(element, index){
                    var query = db.query(sql, [element.id], function(err, rows){
                        if (err) return done(err);
                        else{
                            var menu = JSON.parse(JSON.stringify(rows))[0];
                            menu.value = element.value;
                            origin_pay = origin_pay + menu.price * element.value;
                            sql = 'insert into menu_order set ?';
                            data = {
                                amount: menu.value,
                                menu_id: menu.id,
                                orderlist_id: orderlist_id
                            }
                            var query = db.query(sql, data, function(err, rows){
                                if (err) throw err;
                            })
                        }
                        resData.resArr.push(menu)
                        if (index === arr.length-1){
                            var sql = 'insert into snack_pay set ?';
                            var pay_data = {
                                origin_pay: origin_pay,
                                disc_pay: 0,
                                customer_id: req.user,
                                orderlist_id: orderlist_id
                            }
                            var query = db.query(sql, pay_data, function(err, rows){
                                if (err) throw err;
                            })
                            res.json({resData : resData});
                        }
                    })
                })
            }
        })
    }else{
        res.json({resData : resData});
    }
});


function isLogin(req, res, fn){
    if (req.isAuthenticated()) {
        return fn();
    }else {
        res.redirect('/user/login');
    }
}

module.exports = router;