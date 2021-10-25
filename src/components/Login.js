import React from 'react'
import "./Login.css"
import TextField from '@mui/material/TextField';
import { styled } from '@mui/material/styles';


const Login = ({handleForm}) => {
    //<--Xử lí đóng mở form đăng nhập
    var target = document.querySelector(".login_layer");
    window.onclick = function(event) {
        if (event.target === target) {
            handleForm(false,target)
        }
      }
    
    //<--Customize input field
    const Input = styled(TextField)({
        '& .MuiInputLabel-root':{
            fontWeight:"bold",
            textAlign:"center",
            '&:hover':{
                borderColor:"red"
            }
        },
        '& label.Mui-focused': {
          color: '#FF954A',
        },
        '& .MuiInput-underline:after': {
          borderBottomColor: '#FF954A',
        },
        '& .MuiInput-root': {
            color:"#FF954A",
            font:"inherit",
            fontWeight:"bold",
          '& fieldset': {
            borderColor: '#FF954A',
          },
          '&:hover fieldset': {
            borderColor: '#FF954A',
          },
          '&.Mui-focused fieldset': {
            borderColor: '#FF954A'
          },
        },
      });

    return (
        <div className="login_layer">
            <div className="login_container">
                <div className="login_bg"><span className="title">WELCOM</span></div>
                <div className="login_form">
                    <span className="title">Sign In</span>
                    <Input id="username" label="Username" variant="standard" color="secondary" margin="dense"/>
                    <Input id="password" label="Password" variant="standard" color="secondary" margin="dense"/>

                </div>
            </div>
        </div>
    )
}

export default Login
