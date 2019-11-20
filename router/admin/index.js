var express = require('express');
var router = express.Router();
var db = require('../../db/db');


router.get('/', function(req, res){
    getOnlyAdmin(req, res);
    
});

router.get('/console', function(req, res){
    getOnlyAdmin(req, res);
})

function getOnlyAdmin(req, res){
    if (!req.isAuthenticated()) {
        res.render('admin_login.ejs');
    } else {
        var sql = 'select email from customer where id=?';
        var query = db.query(sql, [req.user], function(err, rows){
            var data = JSON.parse(JSON.stringify(rows));
            if(err) res.redirect('/');
            if (data[0].email === 'admin'){
                res.redirect('/admin/console');
            }else{
                res.redirect('/');
            }
        })
    }   
}


module.exports = router;