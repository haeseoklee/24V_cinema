var express = require('express');
var router = express.Router();
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var db = require('../../db/db');

router.get('/', function(req, res){

    if (!req.isAuthenticated()) {
        res.render('login.ejs');
    } else {
        res.redirect('/');
    }
});

router.post('/', function(req, res, next){ 
    var passport_auth = passport.authenticate('local-login', function(err, user, info){
        if(err) return res.status(500).json(err);
        if(!user) {
            return res.status(401).json(info.message);
        }
        req.login(user, function(err){
            if (err) return next(err);
            return res.json(user);
        });
    });
    passport_auth(req, res, next);
}); 



passport.serializeUser(function(user, done) {
    done(null, user.id);
})

passport.deserializeUser(function(id, done) {
    done(null, id);
})

passport.use('local-login', new LocalStrategy({
        usernameField: 'email',
        passwordField: 'password',
        passReqToCallback: true
        }, function(req, email, password, done) {
            var sql = 'select * from customer where email=?';
            var email = email.trim();
            var query = db.query(sql, [email], function(err, rows) {
                if (err) return done(err);
                if (rows.length) {
                    if (rows[0].pw === password){
                        return done(null, {'email': email, 'id': rows[0].id});
                    }
                    else {
                        return done(null, false,  {'message': '비밀번호가 일치하지 않습니다.'})
                    }
                } else {
                    return done(null, false, {'message': '존재하지 않는 유저입니다.'});
                }
            })
        }
    )
)

module.exports = router;