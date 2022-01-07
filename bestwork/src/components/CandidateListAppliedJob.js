import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import CircularProgress from '@mui/material/CircularProgress';
import { useNavigate } from 'react-router-dom';
const CandidateListAppliedJob = ({listApplied}) => {
    const navigate = useNavigate();
    return (
        <div className="item" >
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Name Of Company</th>
                        <th>Job Name</th>
                        <th>Salary</th>
                        <th>Address</th>
                        <th>Status</th>
                        <th>Start date</th>
                        <th>End date</th>
                    </tr>
                </thead>
                <tbody>
                        {
                            listApplied.map(job=>{
                                return <tr>
                                    <th>{job.Recruiter_Name}</th>
                                    <th style={{"cursor":"pointer"}} onClick={()=>{
                                        navigate(`/job/item/${job.Recruiter_Job_ID}`);
                                    }}>{job.Job_Name}</th>
                                    <th>{`${job.Salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')} VND`}</th>
                                    <th>{job.District + " " + job.city}</th>
                                    <th>{job.Status}</th>
                                    <th>{job.Start_Date.split('T')[0]}</th>
                                    <th>{job.End_Date.split('T')[0]}</th>
                                </tr>
                            })
                        }
                </tbody>
            </table>
        </div>
    )
}

export default CandidateListAppliedJob