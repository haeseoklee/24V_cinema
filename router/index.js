var express = require('express');
var router = express.Router();
var main = require('./main/index');
var api = require('./api/index');
var user = require('./user/index');
var admin = require('./admin/index');
var ticket = require('./ticket/index');
var movie = require('./movie/index');
var cinema = require('./cinema/index');
var market = require('./market/index');

router.use('/', main);
router.use('/api', api);
router.use('/user', user);
router.use('/admin', admin);
router.use('/ticket', ticket);
router.use('/movie', movie);
router.use('/cinema', cinema);
router.use('/market', market);

module.exports = router;