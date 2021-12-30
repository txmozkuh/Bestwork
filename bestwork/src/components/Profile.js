import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import {useParams} from 'react-router-dom'
import CircularProgress from '@mui/material/CircularProgress';

import OutlinedInput from '@mui/material/OutlinedInput';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import ListItemText from '@mui/material/ListItemText';
import Select from '@mui/material/Select';
import Checkbox from '@mui/material/Checkbox';
const Profile = () => {
    const [UserInfo,setInfo] = React.useState({})
    const [userType,setUserType] = React.useState('')

    React.useEffect(() => {
        setUserType(localStorage.getItem('user_status'))
        
        axios.get('http://localhost:3001/candidate/profile',
        {
            withCredentials: true
        }).then((res)=>{
            console.log(res.data.candidate.profile)
            console.log(userType)
            setInfo(res.data.candidate.profile)
        })
    },[])
    
    return (
        <>
        {
            Object.keys(UserInfo).length === 0 && UserInfo.constructor === Object?
            <div className='profile_container'><CircularProgress style={{"color":"rgb(238,125,52)"}}/></div>
            :
            <TableInfo info={UserInfo} />
        }
        </>
    )
}

export default Profile

export const TableInfo = (props) =>{
    let update=false
    const handleUpdateProfile = () => {
        update=!update
        console.log(update)
    }
    
    return (
        <div className='profile_container'>
                    {
                        update===true?
                        <UpdateForm/>
                        :
                        <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Thông tin cá nhân</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Email</td>
                                <td>{props.info.Email}</td>
                            </tr>
                            <tr>
                                <td>Họ và tên</td>
                                <td class='word_color'>{props.info.Candidate_Name}</td>
                            </tr>
                            <tr>
                                <td>Điện thoại</td>
                                <td class='word_color'>{props.info.Phone_Number}</td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td class='word_color'>{props.info.Date_Of_Birth}</td>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td class='word_color'>{props.info.Gender}</td>
                            </tr>
                            <tr>
                                <td>Về bản thân</td>
                                <td class='word_color'>{props.info.About}.</td>
                            </tr>
                        </tbody>
                    </table>
                    }
                    <UpdateForm info={props} />
                    {/* <div className="button" onClick={handleUpdateProfile}>
                        Update profile
                    </div> */}
        </div>
    )
}


export const ListInterestOfUser = (props) => {
    const interests = props.userInterest
    const ITEM_HEIGHT = 40;
    const ITEM_PADDING_TOP = 8;
    const MenuProps = {
    PaperProps: {
        style: {
        maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
        width: 250,
        },
    },
    };
    
    
    const [listInterest, setListInterest] = React.useState([]);

    const handleChange = (event) => {
        const {
        target: { value },
        } = event;
        setListInterest(
        // On autofill we get a stringified value.
        typeof value === 'string' ? value.split(',') : value,
        );
    };
    console.log(listInterest)
    return (
        <div>
        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-multiple-checkbox-label">Interest</InputLabel>
            <Select
            labelId="demo-multiple-checkbox-label"
            id="demo-multiple-checkbox"
            multiple
            value={listInterest}
            onChange={handleChange}
            input={<OutlinedInput label="Interest" />}
            renderValue={(selected) => selected.join(', ')}
            MenuProps={MenuProps}
            >
            {interests.map((interest) => (
                <MenuItem key={interest.Interest_Name} value={interest.Interest_Name}>
                <Checkbox checked={listInterest.indexOf(interest.Interest_Name) > -1}/>
                <ListItemText primary={interest.Interest_Name} />
                </MenuItem>
            ))}
            </Select>
        </FormControl>
        </div>
    );
}

export const ListSkills = (props) => {
    const [skill,setSkill] = React.useState([])
    axios.get('http://localhost:3001/get/skill',
    {
        withCredentials: true
    }).then((res)=>{
        setSkill(res.data.skills)
    })
}

export const ListJobTypes = (props) => {
    const [jobType,setJobType] = React.useState([])
    axios.get('http://localhost:3001/get/job',
    {
        withCredentials: true
    }).then((res)=>{
        setJobType(res.data.jobs)
    })
}

export const TableJobApplied = () => {
    const [jobApplied, setJobApplied] = React.useState([]);
    React.useEffect(() => {
        axios.get('http://localhost:3001/candidate/job-applied',
        {
            withCredentials: true
        }).then((res)=>{
            setJobApplied(res.data.list)
        })
    },[])
    return(
        <div>
            hee
        </div>
    );
}


export const UpdateForm = (props) => {
    let curInfo=props.info.info
    const [CandidateName, SetCandidateName] = React.useState('')
    const [DateOfBirth, SetDateOfBirth] = React.useState('')
    const [Gender, SetGender] = React.useState('')
    const [PhoneNumber, SetPhoneNumber] = React.useState('')
    const [About, SetAbout] = React.useState('')
    const [ApplyPosition, SetApplyPosition] = React.useState([])
    const [WorkingForm, SetWorkingForm] = React.useState('')
    const [InterestID, SetInterestID] = React.useState([])
    const [SkillID, SetSkillID] = React.useState([])
    const [userType,setUserType] = React.useState('')

    const [interests,setInterest] = React.useState([])
    React.useEffect(()=>{
        setUserType(localStorage.getItem('user_status'))
        axios.get('http://localhost:3001/get/interest',
        {
            withCredentials: true
        }).then((res)=>{
            setInterest(res.data.interests)
            console.log(interests)
        })
    },[])
    const handleUpdate = () => {
        console.log('sss')
        if(userType === 'candidate'){
            axios.put('http://localhost:3001/candidate/profile',{
                'candidate-name':CandidateName,
                'date-of-birth':DateOfBirth,
                gender:Gender,
                'phone-number':PhoneNumber,
                about:About,
                'apply-position':'1',
                'working-form':'not',
                'interest-id':'1',
                'skill-id':'1',
            },
            {
            withCredentials: true
            }).then((res)=>{
    
            })
        }
    }
    return(
        <div className='profile_container'>
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Thông tin cá nhân</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Email</td>
                                <td>{curInfo.Email}</td>
                            </tr>
                            <tr>
                                <td>Họ và tên</td>
                                <td class='word_color'>{curInfo.Candidate_Name}</td>
                                <input type="text" name='candidate-name' defaultValue={curInfo.Candidate_Name} onChange={(e) => {
                                    SetCandidateName(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Điện thoại</td>
                                <td class='word_color'>{curInfo.Phone_Number}</td>
                                <input type="text" name='phone-number' defaultValue={curInfo.Phone_Number} onChange={(e) => {
                                    SetPhoneNumber(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td class='word_color'>{curInfo.Date_Of_Birth}</td>
                                <input type="text" name='date-of-birth' defaultValue={curInfo.Date_Of_Birth} onChange={(e) => {
                                    SetDateOfBirth(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td class='word_color'>{curInfo.Gender}</td>
                                <input type="text" name='gender' defaultValue={curInfo.Gender} onChange={(e) => {
                                    SetGender(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Về bản thân</td>
                                <td class='word_color'>{curInfo.Gender}</td>
                                <input type="text" name='about' defaultValue={curInfo.About} onChange={(e) => {
                                    SetAbout(e.target.value)
                                }}></input>
                            </tr>
                        </tbody>
                    </table>
                    <ListInterestOfUser userInterest = {interests}/>
                    <div className="button" onClick={handleUpdate}>
                        Update profile
                    </div>
        </div>
    )
} 