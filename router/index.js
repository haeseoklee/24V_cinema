var express = require('express');
var app = express();
var router = express.Router();
var path = require('path');
var main = require('./main/index');
var user = require('./user/index');

router.use('/', main);
router.use('/user', user);

module.exports = router;