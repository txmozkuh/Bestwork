const createError = require("http-errors");
const passport = require("passport");
const {connect, sql}= require('../Model/connect');
const bcrypt = require('bcrypt')
const loggedInGuard = require('../middlewares/loggedInGuard')
const registerRouter = require('./register');
const authRouter = require('./auth');
const candidateRouter = require('./candidate');
const getRouter = require('./get');


function route(app){
  app.get('/register', async function(req, res){
    const pool = await connect;
    const sqlString = 'SELECT * FROM account';
    return await pool.request()
    .query(sqlString, function(err, data){
      res.send({result:data.recordset});
    });
  });

  app.get('/register/:email', async function(req, res){
    const email = req.params.email;
    const pool = await connect;
    const sqlString = 'SELECT * FROM account WHERE email = @varEmail';
    return await pool.request()
    .input('varEmail',email)
    .query(sqlString, function(err, data){
      res.send({result:data.recordset});
    });
  });

  app.get('/user', loggedInGuard.candidate, function(req, res, next ){
    res.send(req.user);
  });

  app.use('/candidate', candidateRouter);

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
