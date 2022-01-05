import React from 'react'
import './css/Profile.css'
import UpdateFormCandidate from './FormUpdateCandidateInfo'

export const TableInfoCandidate = (props) =>{
    let update=false
    const handleUpdateProfile = () => {
        update=!update
        console.log(update)
    }
    const [show,setShow] = React.useState(false)
    
    return (
        <div className='profile_container'>
                    {
                        show===true?
                        <UpdateFormCandidate/>
                        :
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
                                <td>{props.skill.Skill_Name}</td>
                            </tr>
                            <tr>
                                <td>Sở thích</td>
                                <td>{props.interest.Interest_Name}</td>
                            </tr>
                        </tbody>
                    </table>
                    }
                    <UpdateFormCandidate info={props} />
                    <div className="button" onClick={()=>setShow(false)}>
                        Update profiles
                    </div>
        </div>
    )
}
export default TableInfoCandidate