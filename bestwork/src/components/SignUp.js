import { useState } from 'react';
import './css/SignUp.css'
import Grid from '@mui/material/Grid';
import {Link} from "react-router-dom";
import axios from 'axios';
const SignUp = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [passwordConfirm, setPasswordConfirm] = useState('');
    const [type, setType] = useState("candicate");
    const [code, setCode] = useState("");

    const clickRegister = () => {
        axios.post('https://bestwork-server.herokuapp.com/register', {
            email: email,
            password: password,
            passwordConfirm: passwordConfirm,
            type: type
        }).then((response) => {
            console.log(response)
        });
    }
    const handleUserType = (e) => {
        var curActive=document.querySelector('.active').classList.remove('active')
        var user_type = e.target;
        user_type.classList.add('active')
        setType(user_type.getAttribute('type-value'))
    }
    return (
        <div className="sign_up_container">
            <div className="sign_up_box">
            <div className="sign_up_title">
                <h1><span style={{"color":"rgb(238,125,52)"}}>Sign up </span>an account</h1>
                <p>Create a profile, sign in and take your opportunity</p>
            </div>
            <Grid container className='grid' >
                <Grid item xs={12} md={8} lg={8} >
                    <div className="sign_up_form">
                        <div className="type_btn_group">
                            <div className="candicate_type_btn type_btn active" type-value="candicate" onClick={handleUserType}>Candicate</div>
                            <div className="recruiter_type_btn type_btn"  type-value="recruiter" onClick={handleUserType}>Recruiter</div>
                        </div>
                        <span>Email</span>
                        <div className="input_field">
                            <input type="email" name="email" id="email" placeholder="Email" onChange={(e)=> {
                                    setEmail(e.target.value)
                                }}/>
                            <div className="error_mess"></div>
                        </div>
                        <span >Password</span>
                        <div className="input_field" >
                                <input type="password" name="password" id="password" placeholder="Password" onChange={(e) => {
                                    setPassword(e.target.value)
                                }}/>
                        </div>
                        <span >Confirm Password</span>
                        <div className="input_field" >
                                <input type="password" name="confirm_password" id="confirm_password" placeholder="confirm_password" onChange={(e) => {
                                    setPasswordConfirm(e.target.value)
                                }}/>
                        </div>
                        {
                            type=="recruiter"?
                            <><span >Company Code</span>
                            <div className="input_field" >
                                    <input type="text" name="code" id="code" placeholder="code" onChange={(e) => {
                                        setCode(e.target.value)
                                    }}/>
                            </div></>
                            :
                            <></>
                        }
                        <div className="sign_up_btn">
                            Sign Up
                        </div>
                        
                    </div>
                </Grid>
                <Grid item xs={12} md={4} lg={4} >
                    <div className="img_bg">
                    <img src="/images/signup_bg.svg" alt=" " />
                    </div>
                </Grid>
                    
            </Grid>
            </div>
        </div>
    )
}

export default SignUp
