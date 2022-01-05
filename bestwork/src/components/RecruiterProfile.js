import './css/Profile.css'
import UpdateFormRecruiter from './FormUpdateRecruiterInfo'
import React, { useEffect } from 'react'

export const TableInfoRecruiter = (props) =>{
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
                        <UpdateFormRecruiter/>
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
                                <td>Tên công ty</td>
                                <td>{props.info.Recruiter_Name}</td>
                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td>{props.info.District}, {props.info.City}</td>
                            </tr>
                        </tbody>
                    </table>
                    }
                    <UpdateFormRecruiter info={props} />
                    <div className="button" onClick={handleUpdateProfile}>
                        Update profiles
                    </div>
        </div>
    )
}
export default TableInfoRecruiter