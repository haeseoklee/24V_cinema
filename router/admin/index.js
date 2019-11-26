var express = require('express');
var router = express.Router();
var db = require('../../db/db');


router.get('/console', function(req, res){
    isAdmin(req, res, function(){
        res.render('admin_console.ejs');
    });
})

function isAdmin(req, res, fn){
    if (req.isAuthenticated()) {
        var sql = 'select email from customer where id=?';
        var query = db.query(sql, [req.user], function(err, rows){
            var data = JSON.parse(JSON.stringify(rows));
            if(err) res.redirect('/');
            if (data[0].email === 'admin@admin.com'){
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