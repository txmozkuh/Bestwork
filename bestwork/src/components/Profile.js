import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import {useParams} from 'react-router-dom'
import CircularProgress from '@mui/material/CircularProgress';

const Profile = () => {
    const [UserInfo,setInfo] = React.useState({})
    React.useEffect(() => {
        axios.get('http://localhost:3001/candidate/profile',
        {
            withCredentials: true
        }).then((res)=>{
            setInfo(res.data.candidate.profile)
        })
    }, [])
    
    return (
        <>
        {
            Object.keys(UserInfo).length === 0 && UserInfo.constructor === Object?
            <div className='profile_container'><CircularProgress style={{"color":"rgb(238,125,52)"}}/></div>
            :
            <TableInfo info={UserInfo} />
        }
        </>
    )
}

export default Profile

export const TableInfo = (props) =>{
    let update=false
    const handleUpdateProfile = () => {
        update=!update
        console.log(update)
    }
    
    return (
        <div className='profile_container'>
                    {
                        update===true?
                        <UpdateForm/>
                        :
                        <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Thông tin cá nhân</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Email</td>
                                <td>{props.info.Email}</td>
                            </tr>
                            <tr>
                                <td>Họ và tên</td>
                                <td class='word_color'>{props.info.Candidate_Name}</td>
                            </tr>
                            <tr>
                                <td>Điện thoại</td>
                                <td class='word_color'>{props.info.Phone_Number}</td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td class='word_color'>{props.info.Date_Of_Birth}</td>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td class='word_color'>{props.info.Gender}</td>
                            </tr>
                            <tr>
                                <td>Về bản thân</td>
                                <td class='word_color'>{props.info.About}.</td>
                            </tr>
                        </tbody>
                    </table>
                    }
                    <UpdateForm info={props} />
                    {/* <div className="button" onClick={handleUpdateProfile}>
                        Update profile
                    </div> */}
        </div>
    )
}

export const ListInterests = (props) => {
    const [interest,setInterest] = React.useState([])
    axios.get('http://localhost:3001/get/interest',
    {
        withCredentials: true
    }).then((res)=>{
        setInterest(res.data.interests)
    })
}


export const ListSkills = (props) => {
    const [skill,setSkill] = React.useState([])
    axios.get('http://localhost:3001/get/skill',
    {
        withCredentials: true
    }).then((res)=>{
        setSkill(res.data.skills)
    })
}

export const ListJobTypes = (props) => {
    const [jobType,setJobType] = React.useState([])
    axios.get('http://localhost:3001/get/job',
    {
        withCredentials: true
    }).then((res)=>{
        
        setJobType(res.data.jobs)
    })
}

export const TableJobApplied = () => {
    const [jobApplied, setJobApplied] = React.useState([]);
    React.useEffect(() => {
        axios.get('http://localhost:3001/candidate/job-applied',
        {
            withCredentials: true
        }).then((res)=>{
            setJobApplied(res.data.list)
        })
    },[])
    return(
        <div>
            hee
        </div>
    );
}


export const UpdateForm = (props) => {
    let curInfo=props.info.info
    const [CandidateName, SetCandidateName] = React.useState('')
    const [DateOfBirth, SetDateOfBirth] = React.useState('')
    const [Gender, SetGender] = React.useState('')
    const [PhoneNumber, SetPhoneNumber] = React.useState('')
    const [About, SetAbout] = React.useState('')
    const [ApplyPosition, SetApplyPosition] = React.useState([])
    const [WorkingForm, SetWorkingForm] = React.useState('')
    const [InterestID, SetInterestID] = React.useState([])
    const [SkillID, SetSkillID] = React.useState([])
    const handleUpdate = () => {
        console.log('sss')
        axios.put('http://localhost:3001/candidate/profile',{
            'candidate-name':CandidateName,
            'date-of-birth':DateOfBirth,
            gender:Gender,
            'phone-number':PhoneNumber,
            about:About,
            'apply-position':'1',
            'working-form':'not',
            'interest-id':'1',
            'skill-id':'1',
        },
        {
        withCredentials: true
        }).then((res)=>{

        })
    }
    return(
        <div className='profile_container'>
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Thông tin cá nhân</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Email</td>
                                <td>{curInfo.Email}</td>
                            </tr>
                            <tr>
                                <td>Họ và tên</td>
                                <td class='word_color'>{curInfo.Candidate_Name}</td>
                                <input type="text" name='candidate-name' defaultValue={curInfo.Candidate_Name} onChange={(e) => {
                                    SetCandidateName(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Điện thoại</td>
                                <td class='word_color'>{curInfo.Phone_Number}</td>
                                <input type="text" name='phone-number' defaultValue={curInfo.Phone_Number} onChange={(e) => {
                                    SetPhoneNumber(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td class='word_color'>{curInfo.Date_Of_Birth}</td>
                                <input type="text" name='date-of-birth' defaultValue={curInfo.Date_Of_Birth} onChange={(e) => {
                                    SetDateOfBirth(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td class='word_color'>{curInfo.Gender}</td>
                                <input type="text" name='gender' defaultValue={curInfo.Gender} onChange={(e) => {
                                    SetGender(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Về bản thân</td>
                                <td class='word_color'>{curInfo.Gender}</td>
                                <input type="text" name='about' defaultValue={curInfo.About} onChange={(e) => {
                                    SetAbout(e.target.value)
                                }}></input>
                            </tr>
                        </tbody>
                    </table>
                    <TableJobApplied/>
                    <div className="button" onClick={handleUpdate}>
                        Update profile
                    </div>
        </div>
    )
} 