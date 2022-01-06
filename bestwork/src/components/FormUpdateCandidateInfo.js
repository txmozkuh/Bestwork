import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import {useParams} from 'react-router-dom'
import CircularProgress from '@mui/material/CircularProgress';
import Rating from '@mui/material/Rating';
import OutlinedInput from '@mui/material/OutlinedInput';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import ListItemText from '@mui/material/ListItemText';
import Select from '@mui/material/Select';
import Checkbox from '@mui/material/Checkbox';
import { Tab, typographyClasses } from '@mui/material';
import Stack from '@mui/material/Stack';
import TextField from '@mui/material/TextField';
import AdapterDateFns from '@mui/lab/AdapterDateFns';
import LocalizationProvider from '@mui/lab/LocalizationProvider';
import DesktopDatePicker from '@mui/lab/DesktopDatePicker';
import { set } from 'date-fns';
export const ListInterestsForUser = ({userInterest, listInterestID, SetListInterestID}) => {
    const interests = userInterest
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
        var tempListInterest = typeof value === 'string' ? value.split(',') : value
        setListInterest(
        // On autofill we get a stringified value.
        typeof value === 'string' ? value.split(',') : value,
        );
        var result=tempListInterest.map(name=>{
            var result_check=interests.find((i_name)=>{
                return i_name.Interest_Name === name
            })
            return result_check.Interest_ID
        })
        SetListInterestID(result)

    };
    return (
        <div>
        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-multiple-checkbox-label">Interests</InputLabel>
            <Select
            labelId="demo-multiple-checkbox-label"
            id="demo-multiple-checkbox"
            multiple
            value={listInterest}
            onChange={handleChange}
            input={<OutlinedInput label="Interests" />}
            renderValue={(selected) => selected.join(', ')}
            MenuProps={MenuProps}
            >
            {interests.map((interest) => (
                <MenuItem id={interest.Interest_ID} value={interest.Interest_Name}>
                <Checkbox checked={listInterest.indexOf(interest.Interest_Name) > -1}/>
                <ListItemText primary={interest.Interest_Name} />
                </MenuItem>
            ))}
            </Select>
        </FormControl>
        </div>
    );
}

export const ListSkillsForUser = ({userSkill,SetListSkillID,setRank}) => {
    const skills = userSkill
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
    
    const [listSkill, setListSkill] = React.useState([]);
    const [SkillRate, setSkillRate] = React.useState([]);
    const handleChange = (event) => {
        const {
        target: { value },
        } = event;
        setListSkill(
        // On autofill we get a stringified value.
        typeof value === 'string' ? value.split(',') : value,
        );
        var tempListSkill = typeof value === 'string' ? value.split(',') : value
        var result=tempListSkill.map(name=>{
            var result_check=skills.find((i_name)=>{
                return i_name.Skill_Name === name
            })
            return result_check.Skill_ID
        })
        SetListSkillID(result)
    };
    return (
        <div>
        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-multiple-checkbox-label">Skills</InputLabel>
            <Select
            labelId="demo-multiple-checkbox-label"
            id="demo-multiple-checkbox"
            multiple
            value={listSkill}
            onChange={handleChange}
            input={<OutlinedInput label="Skills" />}
            renderValue={(selected) => selected.join(', ')}
            MenuProps={MenuProps}
            >
            {skills.map((skill) => (
                <MenuItem key={skill.Skill_Name} value={skill.Skill_Name}>
                <Checkbox checked={listSkill.indexOf(skill.Skill_Name) > -1}/>
                <ListItemText primary={skill.Skill_Name} />
                </MenuItem>
            ))}
            </Select>
        </FormControl>
        {
            listSkill.map((skill)=>{
                return <>
                    <div>{skill}
                    <Rating name="customized-10" defaultValue={0} onClick={()=>{
                        setRank(SkillRate.map(item=>{
                            return item.rate
                        }))
                    }} onChange={(e, value)=>{
                        if(listSkill.length<=SkillRate.length){
                            // SkillRate.map((item)=>{
                            //     listSkill.includes(item)?console.log("true"):console.log(item)
                            // })
                            var temp_list = SkillRate
                            temp_list.map((item)=>{
                                return item.name==skill?item.rate=value:item.rate
                            })
                            setSkillRate(temp_list)
                        }
                        else{
                            setSkillRate([...SkillRate,{
                                "name":skill,
                                "rate":value
                            }])
                        }
                        
                    }} max={5} />
                    </div>
                    </>
            })
        }
        </div>
    );
}

export const ListJobType = ({userJobType, SetJobTypeID}) => {
    const jobTypes = userJobType
    console.log(jobTypes)
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
    const [listJobType, setListJobType] = React.useState("");

    const handleChange = (event) => {
        setListJobType(event.target.value)
        jobTypes.map(item=>{
            if(item.Job_Name === event.target.value ){
                SetJobTypeID(item.Job_ID)
            }
        })
    };
    
    console.log(listJobType)
    return (
        <div>
        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-simple-select-label">Job Type</InputLabel>
            <Select
            labelId="demo-simple-select-label"
            id="demo-simple-select"
            value={listJobType}
            onChange={handleChange}
            input={<OutlinedInput label="Job Type" />}
            >
            {jobTypes.map((jobType) => (
                <MenuItem value={jobType.Job_Name}>
                    {jobType.Job_Name}
                </MenuItem>
            ))}
            </Select>
        </FormControl>
        </div>
    );
}
export const ListWorkingForm = ({SetWorkingForm}) => {
    const working_form = [
        'Full-Time',
        'Part-Time',
    ];
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
    const [FormWorking, setFormWorking] = React.useState("");
    const handleChangeWorkingForm = (event) => {
        setFormWorking(event.target.value)
    };
    SetWorkingForm(FormWorking)
    return (
        <div>
        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-multiple-checkbox-label">Working form</InputLabel>
            <Select
                labelId="demo-multiple-checkbox-label"
                id="demo-simple-select"
                value={FormWorking}
                onChange={handleChangeWorkingForm}
                input={<OutlinedInput label="Working form" />}
                >
                {working_form.map((item) => (
                    <MenuItem key={item} value={item}>
                        {item}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
        </div>
    );
}

export const GenderForm = ({SetGender}) => {
    const working_form = [
        'Male',
        'Female',
    ];
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
    const [gender, setGender] = React.useState("");
    const handleChangeGender = (event) => {
        setGender(event.target.value)
    };
    SetGender(gender)
   
    return (
        <div>
        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-multiple-checkbox-label">Gender</InputLabel>
            <Select
                labelId="demo-multiple-checkbox-label"
                id="demo-simple-select"
                value={gender}
                onChange={handleChangeGender}
                input={<OutlinedInput label="Gender" />}
                >
                {working_form.map((item) => (
                    <MenuItem key={item} value={item}>
                        {item}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>
        </div>
    );
}

export const  DatePicker = ({SetDateOfBirth}) => {
    const [start, setStart] = React.useState(new Date());
    const handleChangeStart = (newValue) => {
        setStart(newValue);
    };
    SetDateOfBirth(`${start.getUTCFullYear()}-${start.getUTCMonth()+1}-${start.getUTCDate()}`)
    
    return (
      <LocalizationProvider dateAdapter={AdapterDateFns}>
        <Stack spacing={3}>
          <DesktopDatePicker
            label="Data of birth"
            inputFormat="MM/dd/yyyy"
            value={start}
            onChange={handleChangeStart}
            renderInput={(params) => <TextField {...params} />}
          />
          </Stack>
    </LocalizationProvider>
  );
}
export const UpdateFormCandidate = (props) => {
    let curInfo=props.info.info
    const [CandidateName, SetCandidateName] = React.useState('')
    const [DateOfBirth, SetDateOfBirth] = React.useState('')
    const [Gender, SetGender] = React.useState('')
    const [PhoneNumber, SetPhoneNumber] = React.useState('')
    const [About, SetAbout] = React.useState('')
    const [JobType, SetJobType] = React.useState([])
    const [WorkingForm, SetWorkingForm] = React.useState('')
    const [listInterestID , SetListInterestID] = React.useState([])
    const [listJobTypeID , SetJobTypeID ] = React.useState([])
    const [listSkillID, SetListSkillID] = React.useState([])
    const [userType,setUserType] = React.useState('')
    const [skills,setSkills] = React.useState([])
    const [interests,setInterest] = React.useState([])
    const [rank,setRank] = React.useState([])
    const [submit, setSubmit] = React.useState(false)
    React.useEffect(()=>{
        setUserType(localStorage.getItem('user_status'))
        axios.get('http://localhost:3001/get/interest',
        {
            withCredentials: true
        }).then((res)=>{
            setInterest(res.data.interests)
        })
      
        axios.get('http://localhost:3001/get/skill',
        {
            withCredentials: true
        }).then((res)=>{
            setSkills(res.data.skills)
        })

        axios.get('http://localhost:3001/get/job',
        {
            withCredentials: true
        }).then((res)=>{
            SetJobType(res.data.jobs)
        })
    },[])
    
    const handleUpdate = () => {
        if(userType === 'candidate'){
            axios.put('http://localhost:3001/candidate/profile',{
                'candidate-name':CandidateName,
                'date-of-birth':DateOfBirth,
                gender:Gender==='Male'?true:false,
                'phone-number':PhoneNumber,
                about:About,
                'apply-position':listJobTypeID,
                'working-form':WorkingForm,
                'interest-id':listInterestID,
                'skill-id':[1,2,3],
                'rank': [5,4,3]
            },
            {
            withCredentials: true
            }).then((res)=>{
                setSubmit(true)
                setTimeout(() => {
                    window.location.href="/profile"
                }, 1000); 
            })
        }
    }
    return(
        <div class="profile_container">
            <label class="field field_v3">
                <input class='field__input' type="text" name='candidate-name' placeholder={curInfo.Candidate_Name} onChange={(e) => {
                    SetCandidateName(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Fullname</span>
                </span>
            </label>

            <label class="field field_v3">
                <input class='field__input' type="text" name='phone-number' placeholder={curInfo.Phone_Number} onChange={(e) => {
                    SetPhoneNumber(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Phone number</span>
                </span>
            </label>

            <label class="field field_v3">
                <input class='field__input' type="text" name='about' placeholder={curInfo.About} onChange={(e) => {
                    SetAbout(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">About yourself</span>
                </span>
            </label>
            <br></br>
            <DatePicker SetDateOfBirth ={SetDateOfBirth} />
            <ListInterestsForUser userInterest = {interests} listInterestID = {listInterestID} SetListInterestID = {SetListInterestID} />
            <ListSkillsForUser userSkill = {skills}  listSkillID = {listSkillID} SetListSkillID = {SetListSkillID} setRank={setRank}/>
            <ListJobType userJobType = {JobType} SetJobTypeID = {SetJobTypeID}/>
            <ListWorkingForm SetWorkingForm={SetWorkingForm}/>
            <GenderForm SetGender = {SetGender}/>
            <div className="button" onClick={handleUpdate}>
                {
                    submit?
                    <CircularProgress style={{"color":"white"}}/>
                    :
                    <>Update</>
                }
                    
            </div>
        </div>
    )
} 
export default UpdateFormCandidate
