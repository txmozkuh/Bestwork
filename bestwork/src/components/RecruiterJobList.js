import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import CircularProgress from '@mui/material/CircularProgress';
import { useNavigate } from 'react-router-dom';
import EditJob from './EditJob';
const RecruiterJobList = ({jobList}) => {
    const navigate = useNavigate();
    const [id,setID] = React.useState("")
    return (
        <div>
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Working Type</th>
                        <th>Destination</th>
                        <th>Status</th>
                        <th>Start date</th>
                        <th>End date</th>
                        <th>Edit Job</th>
                    </tr>
                </thead>
                <tbody>
                        {
                            jobList.map(job=>{
                                return <tr>
                                    <th style={{"cursor":"pointer"}} onClick={()=>{
                                        navigate(`/job/item/${job.Recruiter_Job_ID}`);
                                    }}>{job.Job_Name}</th>
                                    <th>{job.Working_Form}</th>
                                    <th>{job.District + " " + job.city}</th>
                                    <th>{job.Status}</th>
                                    <th>{job.Start_Date.split('T')[0]}</th>
                                    <th>{job.End_Date.split('T')[0]}</th>
                                    <button onClick={()=>{
                                        navigate(`/job-edit/${job.Recruiter_Job_ID}`)
                                    }}>edit</button>
                                </tr>
                            })
                        }
                </tbody>
            </table>
        </div>
    )
}

export default RecruiterJobList