const {connect, sql}= require('./connect');
const bcrypt = require("bcrypt");
const body = require("express");

class Account{
    async createAccount(req, res) {
        const pool = await connect;
        let sqlString = `SELECT * FROM Account WHERE Email='${req.body.email}'`;
        const result = await pool.request()
            .query(sqlString);

        if (result.recordset.length > 0) {
            return -1;
        } else if (req.body.password !== req.body.passwordConfirm) {
            return -2;
        } else {
            const passwordHash = await bcrypt.hash(req.body.password, 10);

            sqlString = `INSERT INTO Account (Email, Password, User_Type)
                        VALUES('${req.body.email}', '${passwordHash}', '${req.body.type}')
                        SELECT SCOPE_IDENTITY() AS account_id`;

            const result = await pool.request().query(sqlString);
            const account_id = result.recordset[0].account_id;

            return{
                account_id:account_id,
                email: req.body.email,
                type:req.body.type
            }
        }
    }

    async createInfo(user) {
        const pool = await connect;

        if(user.type === 'candidate'){
            let sqlString = `INSERT INTO Candidate (Account_ID, Email, Public_CV, Created_Date) 
                                        VALUES(${user.account_id}, '${user.email}', '0', CURRENT_TIMESTAMP) `;
            await pool.request().query(sqlString);
        } else if(user.type === 'recruiter'){
            let sqlString = `INSERT INTO Recruiter (Account_ID, Email, Status, Created_Date) 
                                        VALUES(${user.account_id}, '${user.email}', '0', CURRENT_TIMESTAMP)`;
            await pool.request().query(sqlString);
        }

    }
}
module.exports = new Account();



// SELECT * FROM account WHERE ?=?  => get
// INSERT INTO account(email, password,...) VALUE (?,?,...)  => post
// UPDATE account SET email=?, password=?  => put
// DELETE FROM account WHERE email=>?  => delete

// install 2 package 'mssql' and 'msnodesqlv8'