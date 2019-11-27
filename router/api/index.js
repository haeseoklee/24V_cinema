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
    var sql = 'select t.id, t.startdate, t.starttime, t.enddate, t.endtime ' +
     'from screen s  join timetable t on t.screen_id = s.id ' + 
     'join movie m on m.id = t.movie_id  where m.id = ? and s.id = ?';
    var query = db.query(sql, [movie_id, screen_id], function(err, rows){
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

module.exports = router;