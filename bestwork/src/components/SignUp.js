import PersonOutlineIcon from '@mui/icons-material/PersonOutline';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import MailOutlineIcon from '@mui/icons-material/MailOutline';
import axios from 'axios';
import { useState } from 'react';
const SignUp = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [passwordConfirm, setPasswordConfirm] = useState('');
    const [type, setType] = useState('');
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
    return (
        <div className="sign_up_form" >
                <div className="layer"></div>
                <div className="title">Let's Go</div>
                <div className="form">

                    <div className="input_field">
                        <MailOutlineIcon color="disabled"/>
                        <input type="text" name="email" id="email" placeholder="Email" onChange={(e) => {
                            setEmail(e.target.value)
                        }}/>
                    </div>

                    <div className="input_field">
                        <LockOutlinedIcon color="disabled"/>
                        <input type="text" name="password" id="password" placeholder="Password" onChange={(e) => {
                            setPassword(e.target.value)
                        }} />
                    </div>
                    <div className="input_field">
                        <LockOutlinedIcon color="disabled"/>
                        <input type="text" name="passwordConfirm" id="passwordConfirm" placeholder="Password Confirm" onChange={(e) => {
                            setPasswordConfirm(e.target.value)
                        }} />
                    </div>
                    <div className="input_field">
                        <LockOutlinedIcon color="disabled"/>
                        <input type="text" name="type" id="type" placeholder="Type" onChange={(e) => {
                            setType(e.target.value)
                        }} />
                    </div>

                </div>
                <button onClick={clickRegister}>Enter</button>
                <div className="sign_in_option" onClick={()=>{
                                document.querySelector('.login_bg').style.animation="LoginOn 1.5s ease"
                                document.querySelector('.login_bg').style.left="0"
                                document.querySelector('.tag').style.animation="tagMoveRight 1.5s ease"
                                setTimeout(()=>{
                                    document.querySelector('.tag').style.left="60%"
                                },1000)
                           }}>
                            Have an account? <span style={{"color":"#FF954A","font-weight":"bold"}}>Sign In!</span>
                        </div>
                </div>
    )
}

export default SignUp
