var express = require('express');
var router = express.Router();
var db = require('../../db/db');
var seat_no = require('./seat_no');

router.get('/booking', function(req, res){
    isLogin(req, res, function(){
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
            res.render('booking.ejs', {resData: resData});
        })
    });
});

router.get('/booking/result', function(req, res){
    isLogin(req, res, function(){
        var customer_id = req.user;
        var timetable_id = req.query.in_timetable_id;
        var number_of_seats = req.query.in_number_of_seats;
        var selected_seats_arr = req.query.in_selected_seats_arr.split(',');

        var sql = 'insert into reservation set ?'
        resData = {};
        var query = db.query(sql, {timetable_id, customer_id}, function(err, rows){
            if(err) throw err
            else{
                resData.resv_id = rows.insertId;
                resData.timetable_id = timetable_id;
                resData.seat_no = [];
                var sql = 'insert into selected_seat set ?';
                selected_seats_arr.forEach(function(seat){
                    var data = {};
                    data.resv_id = rows.insertId;
                    data.timetable_id = timetable_id;
                    data.seat_no = seat_no[seat];
                    resData.seat_no.push(seat_no[seat]);
                    var query = db.query(sql, data, function(err, rows){
                        if (err) throw err
                        else{
                            var sql = 'update seat set is_able=0 where timetable_id=? and seat_no=?';
                            var query = db.query(sql, [timetable_id, seat_no[seat]], function(err, rows){
                                if (err) throw err
                            })
                        }
                    })
                });
                resData.seat_length = resData.seat_no.length;
                res.render('payment.ejs', {resData: resData});
            }
        });
    });
});


router.post('/booking/result', function(req, res){
    isLogin(req, res, function(){
        var selected_seats = req.body.selected_seats;
        var total_pay = req.body.total_pay;
        var timetable_id = req.body.timetable_id;
        var resData = {};
        var sql = 'select * from timetable t where t.id = ?';
        var query = db.query(sql, [timetable_id], function(err, rows){
            var hasResult = false ? rows.length === 0 : true;
            
            if (err) return done(err);
            if (hasResult){
                resData.result = rows.length;
                resData.data = JSON.parse(JSON.stringify(rows));
                resData.total_pay = total_pay;
                resData.selected_seats = selected_seats;
            }
            else {
                resData.result = 0;
                resData.data = null;
            }
            res.json(resData);
        })
    })
});

router.get('/booking/timetable/:id/seat', function(req, res){
    isLogin(req, res, function(){
        var timetable_id = req.params.id;
        var sql = 'select s.seat_no, s.is_able ' +
        'from seat s join timetable t on t.id = s.timetable_id where t.id = ?';
        var query = db.query(sql, [timetable_id], function(err, rows){
            var hasResult = false ? rows.length === 0 : true;
            var resData = {};
            if (err) return done(err);
            if (hasResult){
                resData.result = rows.length;
                resData.data = JSON.parse(JSON.stringify(rows));
                resData.timetable_id = timetable_id;
            }
            else {
                resData.result = 0;
                resData.data = null;
            }
            res.render('seat.ejs', {'resData': resData});
        })
    });
});

function isLogin(req, res, fn){
    if (req.isAuthenticated()) {
        return fn();
    }else {
        res.redirect('/user/login');
    }
}

module.exports = router;