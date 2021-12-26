import React from 'react'
import "./css/Login.css"
import Grid from '@mui/material/Grid';
import {Link} from "react-router-dom";
import axios from 'axios';


const Login = ({handleForm}) => {
    const [email, setEmail] = React.useState("")
    const [password, setPassword] = React.useState("")
    const clickLogin = () => {
        axios({
            url: 'https://bestwork-server.herokuapp.com/auth/login',
            method: 'POST',
            data: {
                email: "test7521",
                password: "123",
            },
            withCredentials: true
        }).then((res)=>console.log(res));
    }
    const validateEmail = ( e ) => {
        let re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
        var email=e.target.value
        if ( re.test(email) || email.length==0 ) {
            document.querySelector('.error_mess').innerHTML=""
            setEmail(email)
        }
        else {
            document.querySelector('.error_mess').innerHTML="Please enter correct email"
        }
    
    }
    return (
        <div className="login_container">
            <div className="login_box">
            <div className="login_title">
                <h1><span style={{"color":"rgb(238,125,52)"}}>Sign in </span> to account</h1>
                <p>Welcom back, sign in and take your opportunity</p>
            </div>
            <Grid container className='grid' >
                <Grid item xs={12} md={8} lg={8} >
                    <div className="login_form">
                        <span>Email</span>
                        <div className="input_field">
                            <input type="email" name="email" id="email" placeholder="Email" onChange={validateEmail
                                }/>
                            <div className="error_mess"></div>
                        </div>
                        <span >Password</span>
                        <div className="input_field" >
                                <input type="password" name="password" id="password" placeholder="Password" onChange={(e) => {
                                    setPassword(e.target.value)
                                }}/>
                        </div>
                        <div className="sign_in_btn">
                            Sign In
                        </div>
                        <div className="switch_sign_up">
                            <Link to="/sign-up">Sign Up</Link>
                        </div>
                    </div>
                </Grid>
                <Grid item xs={12} md={4} lg={4} >
                    <img src="/images/login_bg.svg" alt=" " />
                </Grid>
                
            </Grid>
            </div>
        </div>
    )
}

export default Login