var express = require('express');
var router = express.Router();
var login = require('./login');
var logout = require('./logout');
var join = require('./join');


router.use('/login', login);
router.use('/logout', logout);
router.use('/join', join);


module.exports = router;
