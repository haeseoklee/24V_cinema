var express = require('express');
var router = express.Router();

router.get('/booking', function(req, res){
    res.render('booking.ejs');
});

router.post('/booking', function(req, res){
    res.render();
});

router.get('/seat', function(req, res){
    res.render();
});

router.post('/seat', function(req, res){
    res.render();
});

router.get('/payment', function(req, res){
    res.render();
});

router.post('/payment', function(req, res){
    res.render();
});

module.exports = router;