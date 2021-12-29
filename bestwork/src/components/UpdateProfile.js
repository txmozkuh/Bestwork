import React from 'react'
import './css/Profile.css'
import axios from 'axios'




const UpdateProfile = () => {
    axios.put('http://localhost:3001/candidate/profile',{
        // candidate-name:
        // date-of-birth:
        // gender:
        // phone-number:
        // about:
        // apply-position:
        // working-form:
        // interest-id:
        // interest-id:
        // skill-id:
        // skill-id:
        // skill-id:
        // rank:
        // rank:
    },
    {
    withCredentials: true
    }).then((res)=>{
        
    })
    return (
        
        <div className='update_profile_container'>

        </div>
    )
}

export default UpdateProfile
