import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import CircularProgress from '@mui/material/CircularProgress';
const RecruiterJobList = ({jobList}) => {
    console.log(jobList)
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
                    </tr>
                </thead>
                <tbody>
                        {
                            jobList.map(job=>{
                                return <tr>
                                    <th>{job.Job_Name}</th>
                                    <th>{job.Working_Form}</th>
                                    <th>{job.District + " " + job.city}</th>
                                    <th>{job.Status}</th>
                                    <th>{job.Start_Date}</th>
                                    <th>{job.End_Date}</th>
                                </tr>
                            })
                        }
                </tbody>
            </table>
        </div>
    )
}

export default RecruiterJobList