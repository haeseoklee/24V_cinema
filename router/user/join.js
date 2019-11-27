var express = require('express');
var router = express.Router();
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var db = require('../../db/db');

router.get('/', function(req, res){
    res.render('join.ejs');
});

router.post('/', passport.authenticate('local-join', {
        successRedirect: '/',
        failureRedirect: '/user/join',
        failureFlash: true
}))

passport.serializeUser(function(user, done) {
    done(null, user.id);
})

passport.deserializeUser(function(id, done) {
    done(null, id);
})

passport.use('local-join', new LocalStrategy({
        usernameField: 'email',
        passwordField: 'password',
        passReqToCallback: true
        }, function(req, email, password, done) {
            var sql = 'select * from customer where email=?';
            var query = db.query(sql, [email], function(err, rows) {
                if (err) return done(err);
                if (rows.length) {
                    return done(null, false, {message: '이미 존재하는 메일입니다.'});
                } else {
                    var sql = {email: email, pw: password}
                    var query = db.query('insert into customer set ?', sql, function(err, rows){
                        if (err) throw err;
                        return done(null, {'email': email, 'id': rows.insertId });
                    })
                }
            })
        }
    )
)

module.exports = router;
