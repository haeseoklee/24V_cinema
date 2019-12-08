var express = require('express');
var router = express.Router();
var db = require('../../db/db');


router.get('/', function(req, res){
    isAdmin(req, res, function(){
        var sql = 'SELECT sum(origin_pay-disc_pay) as selling FROM ticket_pay ' +
        'JOIN reservation ON ticket_pay.resv_id = reservation.id ' +
        'JOIN timetable ON reservation.timetable_id = timetable.id ' +
        'JOIN screen ON timetable.screen_id = screen.id ' +
        'JOIN cinema ON screen.cinema = cinema.cinema ' +
        'WHERE cinema.cinema=?'
        var data = {};
        var cinemaNames = ['서울목동', '인천송도', '대전터미널', '대구현대', '울산진장', '광주터미널', '센텀시티'];
        data.arr = []
        var totalSelling = 0;
        cinemaNames.forEach(function(element, index, array){
            var cinemaName = element;
            var query = db.query(sql, [cinemaName], function(err, rows){
                if (err) throw err;
                else{
                    var info = {}
                    info.cinemaName = element;
                    info.cinemaSelling = Number(JSON.parse(JSON.stringify(rows))[0]['selling']);
                    totalSelling += Number(info.cinemaSelling);
                    sql = 'SELECT sum(origin_pay-disc_pay) as selling FROM snack_pay ' +
                    'JOIN orderlist ON snack_pay.orderlist_id = orderlist.id ' +
                    'JOIN cinema ON orderlist.cinema = cinema.cinema ' +
                    'WHERE cinema.cinema=?'
                    var query = db.query(sql, [element], function(err, rows){
                        if (err) throw err;
                        else{
                            info.cinemaMenuSelling = Number(JSON.parse(JSON.stringify(rows))[0]['selling']);
                            totalSelling += Number(info.cinemaMenuSelling);
                            data.arr.push(info);
                            if (index === array.length-1){
                                data.totalSelling = totalSelling;
                                res.render('admin_console.ejs', {data: data});
                            }
                        }
                    })
                }
            })
        })
    });
})


function isAdmin(req, res, fn){
    if (req.isAuthenticated()) {
        var sql = 'select email from customer where id=?';
        var query = db.query(sql, [req.user], function(err, rows){
            var data = JSON.parse(JSON.stringify(rows));
            if(err) res.redirect('/');
            if (data[0].email === 'jhj967878@naver.com'){
                fn();
            }else{
                res.redirect('/');
            }
        })
    } else {
        res.redirect('/user/login');
    }   
}

module.exports = router;