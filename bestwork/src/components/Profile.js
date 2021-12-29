import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import {useParams} from 'react-router-dom'




const Profile = () => {
    const [info,setInfo] = React.useState([])

    React.useEffect(() => {
        axios.get('http://localhost:3001/candidate/profile',
        {
            withCredentials: true
        }).then((res)=>{
            setInfo(res.data)
        })
    }, [])
    const profile = info.candidate
    const handleUpdateProfile = () => {
        
    }
    return (
        
        <div className='profile_container'>
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
                        <td>{console.log(profile)}</td>
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
            <div className="button" onClick={handleUpdateProfile}>
                Update profile
            </div>
        </div>
    )
}

export default Profile
