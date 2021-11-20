import PersonOutlineIcon from '@mui/icons-material/PersonOutline';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import MailOutlineIcon from '@mui/icons-material/MailOutline';
const SignUp = () => {
    return (
        <div className="sign_up_form" >
                <div className="layer"></div>
                <div className="title">Let's Go</div>
                <div className="form">
                    <div className="input_field">
                        <PersonOutlineIcon color="disabled"/>
                        <input type="text" name="account" id="account" placeholder="Account"  />
                    </div>

                    <div className="input_field">
                        <MailOutlineIcon color="disabled"/>
                        <input type="text" name="email" id="email" placeholder="Email"  />
                    </div>

                    <div className="input_field">
                        <LockOutlinedIcon color="disabled"/>
                        <input type="password" name="password" id="password" placeholder="Password" />
                    </div>

                    <div className="input_field">
                        <LockOutlinedIcon color="disabled"/>
                        <input type="confirm_password" name="confirm_password" id="confirm_password" placeholder="Confirm Password" />
                    </div>
                </div>
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
