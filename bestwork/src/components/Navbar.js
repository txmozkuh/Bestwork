import React from 'react';
import {
    Link,
    Outlet
} from "react-router-dom";
import $ from 'jquery';
import Login from './Login';
import './css/Navbar.css'
import Avatar from '@mui/material/Avatar';
import Tooltip from '@mui/material/Tooltip';
import SearchIcon from '@mui/icons-material/Search';

const Header = () => {
    // $(window).scroll(function () {
    //     if ($(window).scrollTop() >= 80) {
    //     $('.navbar').css('background','rgba(207,228,249,0.9)');
    //     } else {
    //     $('.navbar').css('background','transparent');
    //     }
    //     });
    //HANDLE OPEN LOGIN FORM 
    const [loginForm, setLoginForm] = React.useState(true)
    console.log(`Form stay: ${loginForm?"Close":"Open"}`)
    const handleLoginForm = (value, target) => { //value được truyền từ component Login thông qua func
        setLoginForm(!loginForm)
        loginForm ?
            document.querySelector(".login_layer").style.display = "block" :
            document.querySelector(".login_layer").style.display = "none"
    }
    //HANDLE CHECK LOGIN OR NOT?
    const [isLogin,setLogin]=React.useState(false)

    //
    const navbarElements={
        logo:"images/logo.png",
        links:[
            {
                'title':'Home',
                'link':'/'
            },
            {
                'title':'Job',
                'link':'/job'
            }
            ,
            {
                'title':'About us',
                'link':'/about-us'
            }
            ,
            {
                'title':'Contact',
                'link':'/contact'
            }
        ]
    }
    return ( 
        <div className = "navbar" >
            <Login handleForm = { handleLoginForm }/>
            <Link to = "/" className = 'logo' > < img src = {navbarElements.logo} alt = "" /></Link>
            <SearchBar/>
            <ul className = "link_container">
                {
                    navbarElements.links.map((element)=>{
                        return <li> <Link to = {element.link} className = "link"> {element.title} </Link></li>
                    })
                }
            <li>
            <Tooltip title = "Still not loggin?" >
                <div className = "login_btn" onClick = { handleLoginForm } > Sign In </div> 
            </Tooltip > 
            </li>
            </ul>
            
        </div>      
    )
}

export default Header

export const SearchBar=()=>{
    return (
        <div className="searchBar">
            <SearchIcon/>
            <input type="text" placeholder="Looking for a business?" />
        </div>
        
    )
}