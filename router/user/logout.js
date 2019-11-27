var express = require('express');
var router = express.Router();

router.get('/', function (req, res) {
    if (req.isAuthenticated()){
        req.logout();
        res.redirect('/');
    }else {
        res.redirect('/user/login');
    }
    
    
});


module.exports = router;