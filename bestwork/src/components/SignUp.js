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

    const handleUserType = (e) => {
        var curActive=document.querySelector('.active').classList.remove('active')
        var user_type = e.target;
        user_type.classList.add('active')
        setType(user_type.getAttribute('type-value'))
        for(var i of document.querySelectorAll('.error_mess')){
            i.innerHTML=""
        }
        
    }

    const validateEmail = ( e ) => {
        let re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
        var email=e.target.value
        if ( re.test(email) || email.length===0 ) {
            document.querySelector('.error_mess_email').innerHTML=""
            setEmail(email)
        }
        else {
            document.querySelector('.error_mess_email').innerHTML="Please enter correct email"
        }
    }
    const validatePassword = e => {
        let password=e.target.value
        if(password.length<=6 && password.length >0)
        {
            document.querySelector('.error_mess_pass').innerHTML="Password must have more than 6 characters"
        }
        else{
            setPassword(password)
            document.querySelector('.error_mess_pass').innerHTML=""

        }
    }
    const checkPassword = e =>{
        if(password.length===0)
        {
            document.querySelector('.error_mess_pass').innerHTML="Please enter password first"
        }
    }
    const validateRePassword = e => {
        let repassword=e.target.value
        if(repassword===password){
            document.querySelector('.error_mess_repass').innerHTML=""
            setPasswordConfirm(repassword)
        }
        else{
            document.querySelector('.error_mess_repass').innerHTML="Confirm password must the same to password"
        }
    }
    const validateCompanyCode = e => {
        let compCode=e.target.value
        if(compCode.length>0){
            document.querySelector('.error_mess_code').innerHTML=""
            setCode(compCode)
        }
    }
    const clickRegister = () => {
        var registerInfo={
            email: email,
            password: password,
            passwordConfirm: passwordConfirm,
            type: type
        }
        if(type=="recruiter"){
            registerInfo.code=code
        }
        if(email&&password&&passwordConfirm&&type==="candicate"||email&&password&&passwordConfirm&&code&&type==="recruiter")
        {
            axios.post('http://localhost:3001/register', registerInfo)
            .then((response) => {
                        console.log(response)
            });
            console.log(registerInfo)
        }
        else{
            for(var i in registerInfo){
                if(!registerInfo[i]){
                    console.log(i)
                    if(i==="email"){
                        document.querySelector('.error_mess_email').innerHTML="Please enter email"
                    }
                    if(i==="password"){
                        document.querySelector('.error_mess_pass').innerHTML="Please enter password"
                    }
                    if(i==="passwordConfirm"){
                        document.querySelector('.error_mess_repass').innerHTML="Please enter confirm password"
                    }
                    if(i==="code"&&type==="recruiter"){
                        document.querySelector('.error_mess_code').innerHTML="Please enter code"
                    }

                }
            }
        }
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
                            <input type="email" name="email" id="email" placeholder="Email" onChange={validateEmail}/>
                            <div className="error_mess_email error_mess"></div>
                        </div>
                        <span >Password</span>
                        <div className="input_field" >
                                <input type="password" name="password" id="password" placeholder="Password" onFocus={()=>document.querySelector('.error_mess_pass').innerHTML=""} onChange={validatePassword}/>
                                <div className="error_mess_pass error_mess"></div>
                        </div>
                        <span >Confirm Password</span>
                        <div className="input_field" >
                                <input type="password" name="confirm_password" id="confirm_password" placeholder="confirm_password" onFocus={checkPassword} onChange={validateRePassword}/>
                                <div className="error_mess_repass error_mess"></div>
                        </div>
                        {
                            type==="recruiter"?
                            <><span >Company Code</span>
                            <div className="input_field" >
                                    <input type="text" name="code" id="code" placeholder="code" onChange={validateCompanyCode}/>
                                    <div className="error_mess_code error_mess"></div>
                            </div></>
                            :
                            <></>
                        }
                        <div className="sign_up_btn" onClick={clickRegister}>
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
