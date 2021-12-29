import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import {useParams} from 'react-router-dom'
import CircularProgress from '@mui/material/CircularProgress';

const Profile = () => {
    const [UserInfo,setInfo] = React.useState({})
    React.useEffect(() => {
        axios.get('http://localhost:3001/candidate/profile',
        {
            withCredentials: true
        }).then((res)=>{
            setInfo(res.data.candidate.profile)
        })
    }, [])
    
    return (
        <>
        {
            Object.keys(UserInfo).length === 0 && UserInfo.constructor === Object?
            <div className='profile_container'><CircularProgress/></div>
            :
            <TableInfo info={UserInfo} />
        }
        </>
    )
}

export default Profile

export const TableInfo = (props) =>{
    let update=false
    const handleUpdateProfile = () => {
        update=!update
        console.log(update)
    }
    
    return (
        <div className='profile_container'>
                    {
                        update===true?
                        <UpdateForm/>
                        :
                        <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Thông tin cá nhân</th>
                                <th>{props.info.Email}</th>
                                {console.log(props.info)}
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Email</td>
                                <td>{props.info.Account_ID}</td>
                            </tr>
                            <tr>
                                <td>Họ và tên</td>
                                <td class='word_color'>ví dụ: Nguyễn Văn A</td>
                            </tr>
                            <tr>
                                <td>Điện thoại</td>
                                <td class='word_color'>ví dụ: 0908123456</td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td class='word_color'>ví dụ: 01/01/2001</td>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td class='word_color'>ví dụ: Nam</td>
                            </tr>
                            <tr>
                                <td>Về bản thân</td>
                                <td class='word_color'>ví dụ: Là một người thích code...</td>
                            </tr>
                        </tbody>
                    </table>
                    }
                    <div className="button" onClick={handleUpdateProfile}>
                        Update profile
                    </div>
        </div>
    )
}

export const UpdateForm = () => {
    return(
        <div className='profile_container'>
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Thông tin cá nhân</th>
                                <th>asda</th>
                                input 
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Email</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Họ và tên</td>
                                <td class='word_color'>ví dụ: Nguyễn Văn A</td>
                            </tr>
                            <tr>
                                <td>Điện thoại</td>
                                <td class='word_color'>ví dụ: 0908123456</td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td class='word_color'>ví dụ: 01/01/2001</td>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td class='word_color'>ví dụ: Nam</td>
                            </tr>
                            <tr>
                                <td>Về bản thân</td>
                                <td class='word_color'>ví dụ: Là một người thích code...</td>
                            </tr>
                        </tbody>
                    </table>
                    <div className="button">
                        Update profile
                    </div>
        </div>
    )
} 