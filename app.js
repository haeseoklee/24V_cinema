var express = require('express');
var app = express();


app.listen('3000', function() {
    console.log('서버시작');
});

app.use(express.static('public'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true,
}));
app.set('view engine', 'ejs');

app.get('/', function(req, res){
    res.sendFile(__dirname + '/public/main.html');
})


