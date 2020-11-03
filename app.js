let express = require('express');
let router = require('./router/index');
let passport = require('passport');
let session = require('express-session');
let flash = require('connect-flash');
let app = express();


app.listen('3000', function() {
    console.log('서버시작! 포트번호: 3000');
});

app.set('view engine', 'ejs');
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}));
app.use(express.urlencoded({
    extended: true,
}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
app.use(function(req, res, next){
    res.locals.isAuthenticated = req.isAuthenticated();
    res.locals.id = req.user || null;
    next();
});
app.use(express.static('public'));
app.use(express.json());
app.use(router);