import React from 'react'
import "./css/Login.css"
import Grid from '@mui/material/Grid';
import SignUp from './SignUp'
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
                            <input type="email" name="email" id="email" placeholder="Email" onChange={(e)=> {
                                    setEmail(e.target.value)
                                }}/>
                            <div className="error_mess">Enter a correct form of email</div>
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
                            Sign Up
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