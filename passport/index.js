var passport = require('passport')
    , LocalStrategy = require('passport-local').Strategy;

const {connect, sql}= require('../Model/connect');
const bcrypt = require('bcrypt')

passport.use(new LocalStrategy({
        usernameField: 'email',
        passwordField: 'password'
    },
    async function(username, password, done) {
        const pool = await connect;
        let sqlString = `SELECT * FROM Account WHERE Email='${username}'`;
        const result = await pool.request()
            .query(sqlString);


        const user = result.recordset[0];

        if (!user) {
            return done(null, false, {message: 'Incorrect email'});
        }

        const isValid = bcrypt.compare(password,user.Password);

        if (!isValid) {
            return done(null, false, {message: 'Incorrect password.'});
        }
        return done(null, user);
    }
));

passport.serializeUser(function(user, done) {
    done(null, {
        id: user.User_ID,
        email : user.Email,
        type: user.User_Type
    });
});

passport.deserializeUser(async function(user, done) {
    done(null, user);
});

module.exports = passport;