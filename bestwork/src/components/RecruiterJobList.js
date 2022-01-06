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
                        <th>Tên công việc</th>
                        <th>Thời gian làm việc</th>
                        <th>Thời gian làm việc</th>
                        <th>Địa chỉ</th>
                        <th>Trạng thái</th>
                        <th>Ngày bắt đầu tuyển</th>
                        <th>Ngày kết thúc tuyển</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        {
                            jobList.map(item=>{
                                return <>
                                    <th>{item.Job_Name}</th>
                                </>
                                
                            })
                        }
                    </tr>
                </tbody>
            </table>
        </div>
    )
}

export default RecruiterJobList