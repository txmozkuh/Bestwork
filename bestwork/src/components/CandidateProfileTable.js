import React from 'react'
import './css/Profile.css'
import UpdateFormCandidate from './FormUpdateCandidateInfo'
import axios from 'axios'
import CandidateListAppliedJob from './CandidateListAppliedJob'
import Box from '@mui/material/Box';
import Switch from '@mui/material/Switch';
export const TableInfoCandidate = (props) =>{
    const [update,setUpdate] = React.useState(true)
    const [listApplied,setListApplied] = React.useState([])
    const [checkedRemote,setCheckedRemote] = React.useState(props.info.Public_CV);
    const handleChangeRemote = (event) => {
        setCheckedRemote(!checkedRemote)
        axios.put('http://localhost:3001/candidate/profile',{
            'public-cv':!checkedRemote
        }).then((res)=>{
            console.log(res)
        })
    };
    console.log(checkedRemote)
    React.useEffect(() => {
        axios.get('http://localhost:3001/candidate/job-applied',
        {
        withCredentials: true
        }).then((res)=>{
            console.log(res)
            setListApplied(res.data.list)
        })
    },[])
    console.log("1",checkedRemote)
    return (
        <div className='profile_container'>
            {
                        !update?
                        <>
                        <Box className="remote">
                            <span>Public:</span>
                            <Switch
                                checked={checkedRemote}
                                onChange={handleChangeRemote}
                                inputProps={{ 'aria-label': 'controlled' }}
                            />
                        </Box>
                        <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Information</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Email</td>
                                <td>{props.info.Email}</td>
                            </tr>
                            <tr>
                                <td>Fullname</td>
                                <td>{props.info.Candidate_Name}</td>
                            </tr>
                            <tr>
                                <td>Phone number</td>
                                <td>{props.info.Phone_Number}</td>
                            </tr>
                            <tr>
                                <td>Date of birth</td>
                                <td>{props.info.Date_Of_Birth.split('T')[0]}</td>
                            </tr>
                            <tr>
                                <td>Gender</td>
                                <td>{props.info.Gender===true?'Male':'Female'}</td>
                            </tr>
                            <tr>
                                <td>About</td>
                                <td>{props.info.About}</td>
                            </tr>
                            <tr>
                                <td>Skills</td>

                                <td>{props.skill.map((item) =>{
                                    return <div>{item.Skill_Name} </div>
                                })}</td>
                            </tr>
                            <tr>
                                <td>Interests</td>
                                <td>{props.interest.map((item) => {
                                    return <div>{item.Interest_Name} </div>
                                })}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div className="button" onClick={()=>setUpdate(true)}>
                        Update
                    </div>
                    <CandidateListAppliedJob listApplied = {listApplied}/>
                    </>
                    :
                    <><UpdateFormCandidate info={props} />
                    <div className="button" onClick={()=>setUpdate(false)}>
                        Profile
                    </div></>
            }
            
        </div>
    )
}
export default TableInfoCandidate