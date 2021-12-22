const createError = require("http-errors");
const passport = require("passport");
const {connect, sql}= require('../Model/connect');
const bcrypt = require('bcrypt')
const loggedInGuard = require('../middlewares/loggedInGuard')
const registerRouter = require('./register');
const authRouter = require('./auth');
const candidateRouter = require('./candidate');
const recruiterRouter = require('./recruiter');
const getRouter = require('./get');


function route(app){
  app.use('/candidate',loggedInGuard.candidate, candidateRouter);
  app.use('/recruiter',loggedInGuard.recruiter, recruiterRouter);

  app.use('/register', registerRouter);

  app.use('/get', getRouter);

  app.use('/auth', authRouter);


// catch 404 and forward to error handler
  app.use(function(req, res, next) {
    next(createError(404));
  });

// error handler
  app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error', {layout: false});
  });
}


module.exports = route;
