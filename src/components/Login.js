import React from 'react'
import "./Login.css"
import PersonOutlineIcon from '@mui/icons-material/PersonOutline';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Checkbox from '@mui/material/Checkbox';
import FormControlLabel from '@mui/material/FormControlLabel';
import FacebookOutlinedIcon from '@mui/icons-material/FacebookOutlined';
import GoogleIcon from '@mui/icons-material/Google';


const Login = ({handleForm}) => {
    //<--Xử lí đóng mở form đăng nhập
    var target = document.querySelector(".login_layer");
    window.onclick = function(event) {
        if (event.target === target) {
            handleForm(false,target)
        }
      }
    //<--Xử lí checkbox
    const [checked, setChecked] = React.useState(true);
    const handleChange = (event) => {
      setChecked(event.target.checked);
    };
    return (
        <div className="login_layer">
            <div className="login_container">
                <div className="login_bg"><span className="title">WELCOM</span></div>
                <div className="login_form">

                    <div className="title">Join Us</div>

                    <div className="form">

                        <div className="input_field">
                            <PersonOutlineIcon color="disabled"/>
                            <input type="text" name="account" id="account" placeholder="Username or Email" />
                        </div>

                        <div className="input_field">
                            <LockOutlinedIcon color="disabled"/>
                            <input type="password" name="password" id="password" placeholder="Password" />
                        </div>

                        <FormControlLabel 
                            control={<Checkbox
                                            checked={checked}
                                            onChange={handleChange}
                                            inputProps={{ 'aria-label': 'controlled' }}/>
                                    }
                            label="Remember password"
                        />
                        <button className="button">
                            Sign in
                        </button>
                        <br /><br />
                        <span style={{"color":"rgb(0,0,0,0.4)"}}>or login with</span>
                        <div className="link_login">
                            <div className="fb">
                                <FacebookOutlinedIcon/>
                                <img src="" alt="" />
                                Facebook
                            </div>
                            <div className="gg">
                                {/* <GoogleIcon/> */}
                                <img src="./assets/images/icon_google.png" alt="" />
                                Google
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    )
}

export default Login
