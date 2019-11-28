var express = require('express');
var router = express.Router();
var db = require('../../db/db');

router.get('/', function(req, res){
    isLogin(req, res, function(){
        var sql = 'SELECT id, name, email, ph, membership_id, point FROM customer WHERE id = ?';
        var query = db.query(sql, [req.user], function(err, rows){{
            if (err) throw err;
            var data = JSON.parse(JSON.stringify(rows));
            var sql = 'SELECT CONCAT("CP00000", customer_coupon.id) as coupon_code , coupon.name, coupon.benefit ' +
            'FROM coupon ' + 
            'JOIN customer_coupon ON customer_coupon.coupon_id = coupon.id ' +
            'JOIN customer c ON customer_coupon.customer_id = c.id ' +
            'WHERE c.id=?';
            var query = db.query(sql, [req.user], function(err, rows){
                if (err) throw err;
                data.coupon = JSON.parse(JSON.stringify(rows));
                data.coupon_len = rows.length;
                console.log(data);
                res.render('mypage.ejs', {'data': data});
            })
        }})
        
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