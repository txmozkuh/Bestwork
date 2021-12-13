const {connect, sql}= require('./connect');


exports.getProfile = async (req, res) => {
    const user_id = req.params.id;
    const pool = await connect;
    const request = pool.request();

    //-------------------------- Get Candidate Profile --------------------------------\\
    const result1 = await request.query(`SELECT * 
                                         FROM Candidate join Job on Candidate.Apply_Position = Job.Job_ID 
                                         WHERE User_ID='${user_id}'`);
    const candidate_id = result1.recordset[0].Candidate_ID;
    const profile = result1.recordset[0];

    //-------------------------- Get Candidate_Skill --------------------------------\\
    const result2 = await request.query(`SELECT Candidate_Skill.Skill_ID, Skill.Skill_Name 
                                         FROM Candidate_Skill join Skill 
                                                       on Candidate_Skill.Skill_ID = Skill.Skill_ID 
                                          WHERE Candidate_Skill.Candidate_ID = '${candidate_id}'`);
    const skill = result2.recordset;

    //-------------------------- Get Candidate_Interest --------------------------------\\
    const result3 = await request.query(`SELECT Candidate_Interest.Interest_ID, Interest.Interest_Name 
                                         FROM Candidate_Interest join Interest 
                                                on Candidate_Interest.Interest_ID = Interest.Interest_ID 
                                         WHERE Candidate_Interest.Candidate_ID = '${candidate_id}'`);
    const interest = result3.recordset;

    return {
        profile,
        skill,
        interest
    }
}

exports.updateProfile = async (req, res) => {
    const body = req.body;
    const user = req.user;
    const interest_Id = body['interest-id'];
    const skill_Id = body['skill-id'];

    const pool = await connect;
    const request = pool.request();

    //-------------------------- Candidate --------------------------------\\
    let sqlString = `UPDATE Candidate 
                     SET Candidate_Name = '${body.name}',
                         Date_Of_Birth ='${body.dob}',
                         Gender ='${body.gender}',
                         Phone_Number ='${body.phone}',
                         Email ='${user.email}',
                         About ='${body.about}',
                         Apply_Position ='${body.position}',
                         Working_Form ='${body.workingForm}',
                         Created_Date =CURRENT_TIMESTAMP
                     WHERE User_ID = '${user.id}'`;
    await request.query(sqlString);

    //-------------------------- Candidate_Interest --------------------------------\\
    const result = await request.query(`SELECT Candidate_ID FROM Candidate WHERE User_ID='${user.id}'`);
    const candidate_Id = result.recordset[0].Candidate_ID;

    await request.query(`DELETE FROM Candidate_Interest WHERE Candidate_ID='${candidate_Id}'`);

    for(let i=0; i<interest_Id.length; i++){
        await request.query(`INSERT INTO Candidate_Interest (Interest_ID, Candidate_ID)
                        VALUES('${interest_Id[i]}', '${candidate_Id}')`);
    }

    //-------------------------- Candidate_Skill --------------------------------\\
    await request.query(`DELETE FROM Candidate_Skill WHERE Candidate_ID='${candidate_Id}'`);

    for(let i=0; i<skill_Id.length; i++){
        await request.query(`INSERT INTO Candidate_Skill (Skill_ID, Candidate_ID, Rank)
                        VALUES('${skill_Id[i]}', '${candidate_Id}', '${body.rank[i]}')`);
    }
}

exports.setPublic = async (req, res) => {
    const pool = await connect;
    const request = pool.request();

    //-------------------------- Candidate --------------------------------\\
    let sqlString = `UPDATE Candidate 
                     SET Public_CV = '${req.body.public}'
                     WHERE User_ID = '${req.user.id}'`;
    await request.query(sqlString);
}


// SELECT * FROM account WHERE ?=?  => get
// INSERT INTO account(email, password,...) VALUE (?,?,...)  => post
// UPDATE account SET email=?, password=?  => put
// DELETE FROM account WHERE email=>?  => delete

// install 2 package 'mssql' and 'msnodesqlv8'