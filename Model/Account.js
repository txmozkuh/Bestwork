const {connect, sql}= require('./connect');
const bcrypt = require("bcrypt");

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
            const id = Math.floor(Math.random() * 100000);
            const type = Math.floor(Math.random() * 10) % 3;
            const passwordHash = await bcrypt.hash(req.body.password, 10);

            sqlString = `INSERT INTO Account (User_ID, Email, Password, User_Type)
                        VALUES('${id}','${req.body.email}', '${passwordHash}', '${type}')`;

            await pool.request().query(sqlString);

            return id;
        }
    }

    async createCandidate(userID) {
        const pool = await connect;
        let sqlString = `INSERT INTO Candidate (User_ID, Public_CV) VALUES(${userID}, '0')`;
        await pool.request().query(sqlString);
    }
}
module.exports = new Account();



// SELECT * FROM account WHERE ?=?  => get
// INSERT INTO account(email, password,...) VALUE (?,?,...)  => post
// UPDATE account SET email=?, password=?  => put
// DELETE FROM account WHERE email=>?  => delete

// install 2 package 'mssql' and 'msnodesqlv8'