import React from 'react'
import './css/Profile.css'
import TableInfoCandidate from './CandidateProfileTable'
import TableInfoReCruiter from './RecruiterProfile'
import axios from 'axios'
import CircularProgress from '@mui/material/CircularProgress';
const Profile = () => {
    const [UserInfo,setInfo] = React.useState({})
    const [UserSkill,setUserSkill] = React.useState([])
    const [UserInterest,setUserInterest] = React.useState([])
    const userType =localStorage.getItem('user_status')
    React.useEffect(() => {
        if (userType === 'candidate'){
            axios.get('http://localhost:3001/candidate/profile',
            {
                withCredentials: true
            }).then((res)=>{
                setUserInterest(res.data.candidate.interest)
                setUserSkill(res.data.candidate.skill)
                setInfo(res.data.candidate.profile)
            })
        }
        else {
            axios.get('http://localhost:3001/recruiter/profile',
            {
                withCredentials: true
            }).then((res)=>{
                setInfo(res.data.recruiter)
            })
        }
    },[])
    return (
        <>
        {
            Object.keys(UserInfo).length === 0 && UserInfo.constructor === Object?
            <div className='profile_container'><CircularProgress style={{"color":"rgb(238,125,52)"}}/></div>
            :
            userType==='candidate'?<TableInfoCandidate info={UserInfo} skill ={UserSkill} interest = {UserInterest} />:<TableInfoReCruiter info={UserInfo}/>
        }
        </>
    )
}

export default Profile