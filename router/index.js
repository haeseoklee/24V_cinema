var express = require('express');
var app = express();
var router = express.Router();
var path = require('path');

var main = require('./main/index');
var user = require('./user/index');
var admin = require('./admin/index');
var ticket = require('./ticket/index');
var book = require('./book/index');

var movie = require('./movie/index');
var timetable = require('./timetable/index');
var market = require('./market/index');
<<<<<<< HEAD
var payment = require('./payment/index');
=======
var api = require('./api/index');
>>>>>>> jonghun

router.use('/', main);
router.use('/user', user);
router.use('/admin', admin);
router.use('/book', book);
router.use('/ticket', ticket);
router.use('/movie', movie);
router.use('/timetable', timetable);
router.use('/market', market);
<<<<<<< HEAD
router.use('/payment', payment);
=======
router.use('/api', api);

>>>>>>> jonghun
module.exports = router;