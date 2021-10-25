import React from 'react';
import Login from './Login';
import './Header.css'
import ArrowDropDownIcon from '@mui/icons-material/ArrowDropDown';
import Avatar from '@mui/material/Avatar';
import Tooltip from '@mui/material/Tooltip';

const Header = () => {
    const [loginForm,setLoginForm]=React.useState(true)
    console.log(`Form stay: ${loginForm?"Close":"Open"}`)
    const handleLoginForm=(value,target)=>{//value được truyền từ component Login thông qua func
        setLoginForm(!loginForm)
        loginForm?
        document.querySelector(".login_layer").style.display="block"
        :
        document.querySelector(".login_layer").style.display="none";
    }
    
    return (
        <div className="navbar">
            <Login handleForm={handleLoginForm}/>
            <a href="#https://www.google.com" className="logo"><img src="images/logo_3svg.svg" alt="" /></a>
            <ul>
                <li><a href="#https://www.google.com">Menu</a><ArrowDropDownIcon/></li>
                <li><a href="#https://www.google.com">Job</a><ArrowDropDownIcon/></li>
                <li><a href="#https://www.google.com">Contact</a><ArrowDropDownIcon/></li>
                <li><a href="#https://www.google.com">About Us</a><ArrowDropDownIcon/></li>
                <li><a href="#https://www.google.com">Email</a><ArrowDropDownIcon/></li>
            </ul>

            <div className="mini_profile">

                <Tooltip title="Still not loggin">
                    <div className="login_btn" onClick={handleLoginForm}>Login</div>
                </Tooltip>
                <div className="ava">
                    <Avatar
                        fontSize="large"
                        sx={{width:70,height:70}} 
                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiir9pNAbvpHcWuHTTwsS0MhLDuH2voryIxPQ7-MyRtXUuAQjOs7ikcveMYXPmxrXOKEM&usqp=CAU" fontSize="large"/>
                </div>

                <div className="name">User Name</div>
            </div>
        </div>      
    )
}

export default Header
