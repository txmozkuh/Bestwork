const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const route = require('./routes');
const cors = require('cors');
const session = require('express-session');
const passport = require('./passport');

const app = express();


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser("my-super-super-secret-key"));
app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
    secret: "my-super-super-secret-key",
    resave:true,
    saveUninitialized:true
}));
app.use(passport.initialize());
app.use(passport.session());

// app.use(function(req,res,next){
//     res.locals.user = req.user;
//     next();
// })

app.use(cors({
    origin: "http://localhost:3000",
    credentials: true
}));

route(app);

module.exports = app;
