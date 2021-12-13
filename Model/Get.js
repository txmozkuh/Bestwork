const {connect, sql}= require('./connect');

exports.getInterest = async () => {
    const pool = await connect;
    const request = pool.request();

    //-------------------------- Get Interest --------------------------------\\

    const result = await request.query(`SELECT * FROM Interest`);

    return result.recordset;
}

exports.getSkill = async () => {
    const pool = await connect;
    const request = pool.request();

    //-------------------------- Get Interest --------------------------------\\

    const result = await request.query(`SELECT * FROM Skill`);

    return result.recordset;
}

exports.getJob = async () => {
    const pool = await connect;
    const request = pool.request();

    //-------------------------- Get Interest --------------------------------\\

    const result = await request.query(`SELECT * FROM Job`);

    return result.recordset;
}