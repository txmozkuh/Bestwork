import React from 'react'
import {useParams} from 'react-router-dom'
import './css/Detail.css'
import Grid from '@mui/material/Grid';
import AttachMoneyIcon from '@mui/icons-material/AttachMoney';
import AvTimerIcon from '@mui/icons-material/AvTimer';
import MilitaryTechIcon from '@mui/icons-material/MilitaryTech';
import SendIcon from '@mui/icons-material/Send';
import axios from 'axios';
const JobDetail = () => {
    const [jobDescription, setJobDescription] = React.useState([])
    const [jobRequirement, setJobRequirement] = React.useState([])
    const [jobType, setJobType] =  React.useState([])
    const [jobRecruiter, setJobRecruiter] =  React.useState([])
    const {id} = useParams();
    React.useEffect(() => {
        axios.get(`http://localhost:3001/candidate/job-description/${id}`,
        {
            withCredentials: true
        }).then((res)=>{
            console.log(res)
            setJobDescription(res.data.job.description)
            setJobRequirement(res.data.job.experience_require)
            setJobType(res.data.job.job_type)
            setJobRecruiter(res.data.job.recruiter)
        })
    },[id])
    const handleSendCv = () =>{
        axios.post('http://localhost:3001/candidate/apply',{
            'recruiter-job-id': id
        },
        {
            withCredentials:true
        }).then((res) => {
            console.log(res)
        })
    }
    return (
        <div className='detail_container'>
            <Grid container>
                <Grid item xs={12} md={6} lg={4}  >
                    <div className="comp_info">
                        <div className="ava"><img src="https://images.unsplash.com/photo-1590874315261-788881621f7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80" alt="" /></div>
                        <div className="name">{jobRecruiter.Recruiter_Name}</div>
                        <div className="address">Quận {jobRecruiter.District} - Thành phố {jobRecruiter.City}</div>
                        <div className="contact">Contact here</div>
                    </div>
                </Grid>
                <Grid item xs={12} md={6} lg={8}>
                    <div className="job_info">
                            <div className="basic_info">
                                <div className="name">{jobDescription.Job_Name}</div>
                                <div className="salary">Salary: {jobDescription.Salary}</div>
                                <div className="address">Address: {jobDescription.District} {jobDescription.City}</div>
                            </div>
                            <div className="time_info">
                            <div className="outdated_time">Valid from: {jobDescription.Start_Date} to {jobDescription.End_Date}</div>
                        </div>
                        <div className="description">
                            <h1>Description</h1>
                        </div>
                        <div className="requirements">
                            <h1>Vị trí ứng tuyển</h1>
                            {
                                jobRequirement.map((item) => {
                                    return <p>
                                        • {item.Skill_name}
                                    </p>
                                })
                            }
                        </div>
                        <div className="requirements">
                            <h1>Yêu cầu</h1>
                            {
                                jobRequirement.map((item) => {
                                    return <p>
                                        • {item.Skill_name}
                                    </p>
                                })
                            }
                        </div>

                    </div>
                    
                    <div className="send_cv_btn" onClick={handleSendCv}>
                        Send CV &nbsp;&nbsp; <SendIcon/>
                    </div>
                </Grid>
                
            </Grid>
        </div>
    )
}

export default JobDetail
