import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import CircularProgress from '@mui/material/CircularProgress';
const CandidateListAppliedJob = ({listApplied}) => {

    console.log(listApplied)
    return (
        <div>
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
                                    <th>{job.Job_Name}</th>
                                    <th>{job.Salary} VNĐ</th>
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