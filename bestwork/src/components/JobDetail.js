import React from 'react'
import {useParams} from 'react-router-dom'
import './css/Detail.css'
import Grid from '@mui/material/Grid';
import AttachMoneyIcon from '@mui/icons-material/AttachMoney';
import AvTimerIcon from '@mui/icons-material/AvTimer';
import MilitaryTechIcon from '@mui/icons-material/MilitaryTech';
import SendIcon from '@mui/icons-material/Send';
import axios from 'axios';
import Skeleton from '@mui/material/Skeleton';
import Stack from '@mui/material/Stack';
const JobDetail = () => {
    const [jobDescription, setJobDescription] = React.useState([])
    const [jobRequirement, setJobRequirement] = React.useState([])
    const [jobType, setJobType] =  React.useState([])
    const [jobRecruiter, setJobRecruiter] =  React.useState([])
    const [loaded, setLoaded] = React.useState(true)
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
            setLoaded(false)
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
                    {
                        loaded?
                         <Stack spacing={1}>
                            <Skeleton variant="rectangular" width={350} height={300} />
                            <Skeleton variant="text" />
                            <Skeleton variant="text" />
                        </Stack>
                        :
                        <>
                        <div className="ava"><img src="/images/company.png" alt="" /></div>
                        <div className="name">{jobRecruiter.Recruiter_Name}</div>
                        <div className="address">{jobRecruiter.District} -{jobRecruiter.City}</div>
                        <div className="contact">{jobRecruiter.Tax}</div>
                        </>
                    }
                </div>   
                </Grid>
                <Grid item xs={12} md={6} lg={8}>
                    <div className="job_info">
                        {
                            loaded?
                            <Stack spacing={1}>
                            <Skeleton variant="text" width={500} height={100} />
                            <Skeleton variant="rectangular"  height={600} />
                            <Skeleton variant="text" />
                            <Skeleton variant="text" />
                            </Stack>
                            :
                            <>
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
                                <h1>Requirement</h1>
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
                        <div className="benefit">
                            <h1>Benefit</h1>
                            <div className="salary b_box">
                                <AttachMoneyIcon/>
                                Price Bonus  
                            </div>
                            <div className="time b_box">
                                <AvTimerIcon/>
                                Working time benefit
                            </div>
                            <div className="award b_box">
                                <MilitaryTechIcon/>
                                Achievement and bonus
                            </div>
                        </div></>
                        }
                    </div>
                   
                    <div className="send_cv_btn" onClick={handleSendCv}>
                        {
                            loaded?
                            <Stack spacing={1}>
                            <Skeleton variant="rectangular"  height={600} />
                            </Stack>
                            :
                            <>Send CV &nbsp;&nbsp; <SendIcon/></>
                        }
                        
                    </div>
                </Grid>
                
            </Grid>
        </div>
    )
}

export default JobDetail
