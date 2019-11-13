var express = require('express');
var router = express.Router();
var login = require('./login');
var logout = require('./logout');
var join = require('./join');
var mypage = require('./mypage');

router.use('/login', login);
router.use('/logout', logout);
router.use('/join', join);
router.use('/mypage', mypage);

module.exports = router;
