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
                sql = 'SELECT CONCAT("RS00000",reservation.id) as resv_id, ' +
                'date_format(resv_date, "%Y-%m-%d") as resv_date, customer.name, title, startdate, starttime, ' +
                'cinema, screen.name as screen FROM reservation ' +
                'JOIN timetable ON reservation.timetable_id = timetable.id ' +
                'JOIN customer ON reservation.customer_id = customer.id ' +
                'JOIN screen ON timetable.screen_id = screen.id ' +
                'JOIN movie ON timetable.movie_id = movie.id ' +
                `WHERE customer.id=${req.user} ` + 
                'ORDER BY reservation.id DESC LIMIT 1'
                var query = db.query(sql, function(err, rows){
                    if (err) throw err;
                    data.reserv_list = JSON.parse(JSON.stringify(rows));
                    data.reserv_list_len = rows.length;
                    sql = 'SELECT seat_no FROM selected_seat ' +
                    'JOIN reservation ON reservation.id = selected_seat.resv_id ' +
                    'JOIN customer ON reservation.customer_id = customer.id ' +
                    `WHERE customer.id=${req.user} AND reservation.id = ` +
                    '(SELECT max(reservation.id) FROM reservation JOIN customer ON reservation.customer_id = customer.id ' +
                    `WHERE customer.id=${req.user})`
                    var query = db.query(sql, function(err, rows){
                        if (err) throw err;
                        data.reserv_seat = JSON.parse(JSON.stringify(rows));
                        data.reserv_seat_len = rows.length
                        console.log(data);
                        res.render('mypage.ejs', {'data': data});
                    })  
                })
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