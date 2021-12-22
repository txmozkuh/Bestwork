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
        let sqlString = `SELECT Account.Account_ID, Account.Email, Account.User_Type, Account.Password, 
                                Recruiter.Recruiter_ID
                         FROM Account join Recruiter on Account.Account_ID = Recruiter.Account_ID
                         WHERE Account.Email='${username}'`;
        const result = await pool.request()
            .query(sqlString);


        const user = result.recordset[0];

        if (!user) {
            return done(null, false, {message: 'Email not exist'});
        }

        const isValid = await bcrypt.compare(password,user.Password.trim());

        if (!isValid) {
            return done(null, false, {message: 'Incorrect password'});
        }
        return done(null, user);
    }
));

passport.serializeUser(function(user, done) {
    done(null, {
        account_id: user.Account_ID,
        recruiter_id: user.Recruiter_ID,
        email : user.Email,
        type: user.User_Type
    });
});

passport.deserializeUser(async function(user, done) {
    done(null, user);
});

module.exports = passport;