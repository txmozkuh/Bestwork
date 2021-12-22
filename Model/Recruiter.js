const {connect, sql}= require('./connect');

exports.getProfile = async (req, res) => {
    const recruiter_id = req.user.recruiter_id;
    const pool = await connect;
    const request = pool.request();

    //-------------------------- Get Recruiter Profile --------------------------------\\
    const result = await request.query(`SELECT * 
                                         FROM Recruiter
                                         WHERE Recruiter_ID='${recruiter_id}'`);
    const profile = result.recordset[0];

    return {
        profile
    }
}

exports.updateProfile = async (req, res) => {
    const body = req.body;
    const user = req.user;

    const pool = await connect;
    const request = pool.request();

    //-------------------------- Recruiter --------------------------------\\
    let sqlString = `UPDATE Recruiter 
                     SET Recruiter_Name = N'${body['recruiter-name']}',
                         District = N'${body.district}',
                         City = N'${body.city}',
                         Tax = '${body.tax}'
                     WHERE Recruiter_ID = '${user.recruiter_id}'`;
    await request.query(sqlString);
}

exports.createJob = async (req, res) => {
    const body = req.body;
    const user = req.user;

    const pool = await connect;
    const request = pool.request();
    let sqlString = '';

    //-------------------------- Recruiter_Job --------------------------------\\
    sqlString = `INSERT INTO Recruiter_Job (Recruiter_ID, Job_Name, Salary, Start_Date, End_date, District,
                                                City, Working_Form, Recruitment_Quantity, Status, Remote,
                                                Years_Of_Experient, Type_ID) 
                    VALUES(${user.recruiter_id}, N'${body['job-name']}', '${body.salary}', '${body['start-date']}',
                     '${body['end-date']}', N'${body.district}', N'${body.city}', N'${body['working-form']}', 
                     '${body['recruitment_quantity']}', N'pending', '${body.remote}', '${body['years-of-experient']}',
                     '${body['type-id']}')
                    SELECT SCOPE_IDENTITY() AS Job_ID`;

    const result = await request.query(sqlString);
    const job_id = result.recordset[0].Job_ID;

    //-------------------------- Experience_Require --------------------------------\\
    for(let i = 0; i<body['skill-id'].length; i++){
        await request.query(`INSERT INTO Experience_Require (Recruiter_Job_ID, Skill_ID)
                                  VALUES ('${job_id}', '${body['skill-id'][i]}')`);
    }
}

exports.getCreatedJob = async (req, res) => {
    const job_id = req.params.jobId;
    const pool = await connect;
    const request = pool.request();
    let result =  null;
}

exports.getJobDescription = async (req, res) => {
    const job_id = req.params.jobId;
    const pool = await connect;
    const request = pool.request();
    let result =  null;

    //-------------------------- Get Recruiter Profile --------------------------------\\
    result = await request.query(`SELECT * 
                                  FROM Recruiter_Job
                                  WHERE Recruiter_Job_ID='${job_id}'`);
    const description = result.recordset[0];

    //-------------------------- Get Job Type --------------------------------\\
    result = await request.query(`SELECT Job.Job_Name, Job_Type.Type_Name
                                  FROM Job_Type join Job on Job_Type.Job_ID = Job.Job_ID
                                  WHERE Type_ID='${description.Type_ID}'`);
    const job_type = result.recordset[0];

    //-------------------------- Skill requirement --------------------------------\\
    result = await request.query(`SELECT Skill.Skill_name
                                  FROM Experience_Require join Skill on Experience_Require.Skill_ID = Skill.Skill_ID
                                  WHERE Recruiter_Job_ID='${description.Recruiter_Job_ID}'`);
    const experience_require = result.recordset;

    return {
        description,
        job_type,
        experience_require
    }
}

exports.updateJob = async (req, res) => {

}


// SELECT * FROM account WHERE ?=?  => get
// INSERT INTO account(email, password,...) VALUE (?,?,...)  => post
// UPDATE account SET email=?, password=?  => put
// DELETE FROM account WHERE email=>?  => delete

// install 2 package 'mssql' and 'msnodesqlv8'