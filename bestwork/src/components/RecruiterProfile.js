import './css/Profile.css'
import UpdateFormRecruiter from './FormUpdateRecruiterInfo'
import React, { useEffect } from 'react'
import axios from 'axios'
import RecruiterJobList from './RecruiterJobList'
export const TableInfoRecruiter = (props) =>{
    const [update,setUpdate] = React.useState(false)
    const [jobList, setJobList] = React.useState([])
    useEffect(() => {
        axios.get('http://localhost:3001/recruiter/job-list',
        {
            withCredentials: true
        }).then((res)=>{
            setJobList(res.data.jobList)
        })
    },[])
    return (
        <div className='profile_container'>
                    {
                        !update?
                        <>
                        <table class="styled-table">
                            <thead>
                                <tr>
                                    <th>Thông tin cá nhân</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Email</td>
                                    <td>{props.info.Email}</td>
                                </tr>
                                <tr>
                                    <td>Tên công ty</td>
                                    <td>{props.info.Recruiter_Name}</td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ</td>
                                    <td>{props.info.District}, {props.info.City}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div className="button" onClick={() => setUpdate(true)}>
                            Update profiles
                        </div>  
                        <RecruiterJobList jobList = {jobList}/>
                        </>
                        :
                        <UpdateFormRecruiter info={props} />
                    }
                    
        </div>
    )
}
export default TableInfoRecruiter