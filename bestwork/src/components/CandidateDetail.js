import React from 'react'
import './css/Profile.css'
import { useParams } from 'react-router-dom';
import axios from 'axios';
import CircularProgress from '@mui/material/CircularProgress';
import Snackbar from '@mui/material/Snackbar';
import MuiAlert from '@mui/material/Alert';
const CandidateDetail = () => {
    const {id} = useParams()
    const [profile,setProfile] = React.useState([])
    const [skill,setSkill] = React.useState([])
    const [interest,setInterest] = React.useState([])
    console.log(id)
    React.useEffect(()=>{
        axios.get(`http://localhost:3001/recruiter/candidate-profile/${id}`,
        {
        withCredentials: true
        }).then((res)=>{
            console.log(res)
            setProfile(res.data.candidate.profile)
            setSkill(res.data.candidate.skill)
            setInterest(res.data.candidate.interest)
        })
    },[])
    const [open, setOpen] = React.useState(false);
    const [submit, setSubmit] = React.useState(false)
    const Alert = React.forwardRef(function Alert(props, ref) {
        return <MuiAlert elevation={6} ref={ref} variant="filled" {...props} />;
      });
    const handleClick = () => {
      setOpen(true);
    };
    const handleClose = (event, reason) => {
      if (reason === 'clickaway') {
        return;
      }
  
      setOpen(false);
    };
    const handleProfile = () => {
        setSubmit(true)
        handleClick()
        setSubmit(false)
        setTimeout(() => {
            window.location.href="/star-cv"
        }, 1000); 
        
    }
    return (
        <div>
        {
            Object.keys(interest).length===0&&Object.keys(profile).length===0&&Object.keys(skill).length===0?
            <div className='profile_container'><CircularProgress style={{"color":"rgb(238,125,52)"}}/></div>
            :
            <div className='profile_container'>
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
                                    <td>{profile.Email}</td>
                                </tr>
                                <tr>
                                    <td>Fullname</td>
                                    <td>{profile.Candidate_Name}</td>
                                </tr>
                                <tr>
                                    <td>Phone number</td>
                                    <td>{profile.Phone_Number}</td>
                                </tr>
                                <tr>
                                    <td>Date of birth</td>
                                    <td>{profile.Date_Of_Birth.split('T')[0]}</td>
                                    
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td>{profile.Gender===true?"Male":"Female"}</td>
                                </tr>
                                <tr>
                                    <td>About</td>
                                    <td>{profile.About}</td>
                                </tr>
                                <tr>
                                    <td>Skills</td>

                                    <td>{skill.map((item) =>{
                                        return <div>{item.Skill_Name} </div>
                                    })}</td>
                                </tr>
                                <tr>
                                    <td>Interests</td>
                                    <td>{interest.map((item) => {
                                        return <div>{item.Interest_Name} </div>
                                    })}</td>
                                </tr>
                            </tbody>
                    </table>
                    <div className="button"  onClick={handleProfile}>
                    {
                        submit?
                        <CircularProgress style={{"color":"white"}}/>
                        :
                        <>Back to starCV</>
                    }
            </div>
            </div>

        } 
        </div>
    )
}

export default CandidateDetail