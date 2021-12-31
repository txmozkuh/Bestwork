import React from 'react'
import "./css/Login.css"
import Grid from '@mui/material/Grid';
import {Link} from "react-router-dom";
import axios from 'axios';
import Snackbar from '@mui/material/Snackbar';
import MuiAlert from '@mui/material/Alert';
import CircularProgress from '@mui/material/CircularProgress';

const Login = () => {
    const [email, setEmail] = React.useState("")
    const [password, setPassword] = React.useState("")
    const [open, setOpen] = React.useState(false);
    const [submit, setSubmit] = React.useState(false)
    const [typeUser,setTypeUser] = React.useState("")
    const Alert = React.forwardRef(function Alert(props, ref) {
        return <MuiAlert elevation={6} ref={ref} variant="filled" {...props} />;
      });
    const handleClick = () => {
      setOpen(true);
    };
    const handleClose = (event, reason) => {
      if (reason === 'clickaway') {
        return;
      }
  
      setOpen(false);
    };
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
    
    const clickLogin = () => {
        var loginInfo={
            email: email,
            password: password
        }
        
        if(email&&password){
            setSubmit(true)
            axios.post('http://localhost:3001/auth/login',loginInfo,
            {
                withCredentials:true
            }).then((res) => {
                
                console.log(res)
                if(res.data.message === "Successfully Authentication !!"){
                    console.log(res.data.user.Type.replace(/\s/g, ""))
                    localStorage.setItem("user_status",res.data.user.Type.replace(/\s/g, ""))
                    setSubmit(false)
                    handleClick()
                    setTimeout(() => {
                        window.location.href="/"
                    }, 1000); 
                }
                else{
                    setSubmit(false)
                    setTimeout(()=>{
                        alert(res.data)
                    },500)
                }
            })
        }
        else{
            for(var i in loginInfo){
                if(!loginInfo[i]){
                    console.log(i)
                    if(i==="email"){
                        document.querySelector('.error_mess_email').innerHTML="Please enter email"
                    }
                    if(i==="password"){
                        document.querySelector('.error_mess_pass').innerHTML="Please enter password"
                    }
                }
            }
        }
    }
    const clickProfile = () => {

        axios.get('http://localhost:3001/candidate/profile',
        {
            withCredentials: true
        }).then((res)=>{
            console.log(res.data)
        })
    }
    
    return (
        <div className="login_container">
            <div className="login_box">
            <div className="login_title">
                <h1><span style={{"color":"rgb(238,125,52)"}}>Sign in </span> to account</h1>
                <p>Welcome back, sign in and take your opportunity</p>
            </div>
            <Grid container className='grid' >
                <Grid item xs={12} md={8} lg={8} >
                    <div className="login_form">
                        <span>Email</span>
                        <div className="input_field">
                            <input type="email" name="email" id="email" placeholder="Email" onChange={validateEmail}/>
                            <div className="error_mess error_mess_email"></div>
                        </div>
                        <span >Password</span>
                        <div className="input_field" >
                                <input type="password" name="password" id="password" placeholder="Password" onFocus={()=>document.querySelector('.error_mess_pass').innerHTML=""} onChange={validatePassword}/>
                                <div className="error_mess_pass error_mess"></div>
                        </div>
                        <div className="sign_in_btn" onClick={clickLogin}>
                            {
                                submit?
                                <CircularProgress style={{"color":"white"}}/>
                                :
                                <>Sign In</>
                            }
                        </div>
                        <div className="switch_sign_up" >
                            <Link to="/sign-up">Sign Up</Link>
                        </div>
                    </div>
                </Grid>
                <Grid item xs={12} md={4} lg={4} >
                    <img src="/images/login_bg.svg" alt=" " />
                </Grid>
                <Snackbar
                    open={open}
                    autoHideDuration={6000}
                    onClose={handleClose}
                >
                    <Alert onClose={handleClose} severity="success" sx={{ width: '100%' }}>
                        Sign in successfully
                        </Alert>
                </Snackbar>

            </Grid>
            </div>
        </div>
    )
}

export default Login