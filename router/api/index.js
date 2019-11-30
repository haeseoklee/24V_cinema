var express = require('express');
var router = express.Router();
var db = require('../../db/db');

router.post('/myinfo/:user_id', function(req, res){
    var user_id =  req.params.user_id;
    var ph = req.body.ph;
    var email = req.body.email;
    var sql = `update customer set ? where id=${user_id}`;
    var query = db.query(sql, {ph, email}, function(err, rows){
        if (err) return res.status(400).json({'success': false})
        data = JSON.parse(JSON.stringify(rows))
        res.status(200).json({'success': true})
    })
})

router.get('/selected_movie/:id', function(req, res){
    var movie_id = req.params.id;
    var sql = 'select distinct s.id, s.name, s.cinema ' +
     'from screen s  join timetable t on t.screen_id = s.id ' + 
     'join movie m on m.id = t.movie_id  where m.id = ?';
    var query = db.query(sql, [movie_id], function(err, rows){
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
        res.json(resData);
    })
    
})

router.get('/selected_movie/:movie_id/selected_screen/:screen_id', function(req, res){
    var movie_id = req.params.movie_id;
    var screen_id = req.params.screen_id;
    var sql = 'select t.id, t.startdate, t.starttime, t.enddate, t.endtime, m.title, s.name ' +
     'from screen s join timetable t on t.screen_id = s.id ' + 
     'join movie m on m.id = t.movie_id  where m.id = ? and s.id = ?';
    var query = db.query(sql, [movie_id, screen_id], function(err, rows){
        var hasResult = false ? rows.length === 0 : true;
        var resData = {};
        if (err) throw err;
        if (hasResult){
            resData.result = rows.length;
            resData.data = JSON.parse(JSON.stringify(rows));
        }
        res.json(resData);
    })
    
})


router.get('/booking/timetable/:id/seat', function(req, res){
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
        res.json(resData);
    });
});

router.get('/payment', function(req, res){
    var resData = {};
    var sql = 'select id from reservation order by id desc limit 1';
    var query = db.query(sql, function(err, rows){
        if (err) throw err;
        else{
            resData.resv_id = JSON.parse(JSON.stringify(rows))[0].id;
            var sql = 'SELECT CONCAT("RS00000",reservation.id) as resv_id, ' +
            'date_format(resv_date, "%Y-%m-%d") as resv_date, customer.name, title, startdate, starttime, ' +
            'cinema, screen.name as screen FROM reservation ' +
            'JOIN timetable ON reservation.timetable_id = timetable.id ' +
            'JOIN customer ON reservation.customer_id = customer.id ' +
            'JOIN screen ON timetable.screen_id = screen.id ' +
            'JOIN movie ON timetable.movie_id = movie.id ' +
            `WHERE customer.id=${req.user} and reservation.id=${resData.resv_id}`
            var query = db.query(sql, function(err, rows){
                if (err) throw err;
                else{
                    resData.resInfo = JSON.parse(JSON.stringify(rows));
                    var sql = 'SELECT coupon.id, coupon.name, coupon.benefit FROM coupon ' +  
                    'JOIN customer_coupon ON customer_coupon.coupon_id = coupon.id ' +
                    'JOIN customer ON customer_coupon.customer_id = customer.id ' +      
                    'WHERE customer.id = ?'
                    var query = db.query(sql, [req.user], function(err, rows){
                        if (err) throw err;
                        else{
                            resData.coupon_list = JSON.parse(JSON.stringify(rows));
                            res.json(resData);
                        }
                    })
                }
                
            })
        }
    })
    
});


router.post('/payment', function(req, res){
    var sql = 'select pw from customer where id = ?'
    var query = db.query(sql, [req.user], function(err, rows){
        if (err) throw err
        else{
            var pw = JSON.parse(JSON.stringify(rows))[0].pw;
            if(pw.substring(0, 2) === req.body.password_two){
                if (req.body.couponId !== "0"){
                    sql = 'DELETE FROM customer_coupon WHERE customer_id=? AND coupon_id=?';
                    var query = db.query(sql, [req.user, req.body.couponId], function(err, rows){
                        if (err) throw err
                        else{
                            var sql = 'select id from reservation order by id desc limit 1';
                            var query = db.query(sql, function(err, rows){
                                if(err) throw err
                                else{
                                    var resv_id = JSON.parse(JSON.stringify(rows))[0].id;
                                    var customer_id = req.user;
                                    var origin_pay = Number(req.body.origin_pay);
                                    var disc_pay = req.body.disc_pay;
                                    var data = {origin_pay, disc_pay, customer_id, resv_id}
                                    sql = 'insert into ticket_pay set ?';
                                    var query = db.query(sql, data, function(err, rows){
                                        console.log('2');
                                        if(err) throw err
                                        else{
                                            res.json({success: true});
                                        }
                                    })
                                }
                            })
                        }
                    })
                }
                var sql = 'select id from reservation order by id desc limit 1';
                var query = db.query(sql, function(err, rows){
                    if(err) throw err
                    else{
                        var resv_id = JSON.parse(JSON.stringify(rows))[0].id;
                        var customer_id = req.user;
                        var origin_pay = req.body.origin_pay;
                        var disc_pay = req.body.disc_pay;
                        var data = {origin_pay, disc_pay, customer_id, resv_id}
                        sql = 'insert into ticket_pay set ?';
                        var query = db.query(sql, data, function(err, rows){
                            console.log('1');
                            if(err) throw err
                            else{
                                res.json({success: true});
                            }
                        })
                    }
                })
                
            }else{
                res.json({success: false})
            }
        }
    })
})


module.exports = router;