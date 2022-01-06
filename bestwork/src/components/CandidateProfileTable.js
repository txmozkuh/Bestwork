import React from 'react'
import './css/Profile.css'
import UpdateFormCandidate from './FormUpdateCandidateInfo'
import axios from 'axios'
import CandidateListAppliedJob from './CandidateListAppliedJob'
export const TableInfoCandidate = (props) =>{
    const [update,setUpdate] = React.useState(false)
    const [listApplied,setListApplied] = React.useState([])
    React.useEffect(() => {
        axios.get('http://localhost:3001/candidate/job-applied',
        {
        withCredentials: true
        }).then((res)=>{
            console.log(res)
        })
    },[])
    return (
        <div className='profile_container'>
            {
                        !update?
                        <><table class="styled-table">
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
                                <td>Họ và tên</td>
                                <td>{props.info.Candidate_Name}</td>
                            </tr>
                            <tr>
                                <td>Điện thoại</td>
                                <td>{props.info.Phone_Number}</td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td>{props.info.Date_Of_Birth}</td>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td>{props.info.Gender}</td>
                            </tr>
                            <tr>
                                <td>Về bản thân</td>
                                <td>{props.info.About}</td>
                            </tr>
                            <tr>
                                <td>Kỹ năng</td>

                                <td>{props.skill.map((item) =>{
                                    return <div>{item.Skill_Name} </div>
                                })}</td>
                            </tr>
                            <tr>
                                <td>Sở thích</td>
                                <td>{props.interest.map((item) => {
                                    return <div>{item.Interest_Name} </div>
                                })}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div className="button" onClick={()=>setUpdate(true)}>
                        Update profile
                    </div>
                    <CandidateListAppliedJob listApplied = {listApplied}/>
                    </>
                    
                    :
                    <UpdateFormCandidate info={props} />
            }
        </div>
    )
}
export default TableInfoCandidate