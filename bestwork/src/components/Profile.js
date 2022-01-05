import React from 'react'
import './css/Profile.css'
import TableInfo from './CandidateProfileTable'
import axios from 'axios'
import CircularProgress from '@mui/material/CircularProgress';
const Profile = () => {
    const [UserInfo,setInfo] = React.useState({})
    const [UserSkill,setUserSkill] = React.useState([])
    const [UserInterest,setUserInterest] = React.useState([])

    React.useEffect(() => {
        const userType = localStorage.getItem('user_status')
        console.log(userType)
        if (userType === 'candidate'){
            axios.get('http://localhost:3001/candidate/profile',
            {
                withCredentials: true
            }).then((res)=>{
                console.log(res.data)
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
                console.log(res.data)
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
            <TableInfo info={UserInfo} skill ={UserSkill} interest = {UserInterest} />
        }
        </>
    )
}

export default Profile
