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
import { Tab } from '@mui/material';
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
            <InputLabel id="demo-multiple-checkbox-label">Sở Thích</InputLabel>
            <Select
            labelId="demo-multiple-checkbox-label"
            id="demo-multiple-checkbox"
            multiple
            value={listInterest}
            onChange={handleChange}
            input={<OutlinedInput label="Sở Thích" />}
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
            <InputLabel id="demo-multiple-checkbox-label">Kỹ Năng</InputLabel>
            <Select
            labelId="demo-multiple-checkbox-label"
            id="demo-multiple-checkbox"
            multiple
            value={listSkill}
            onChange={handleChange}
            input={<OutlinedInput label="Kỹ Năng" />}
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
                    <Rating name="customized-10" defaultValue={0} onClick={() => {
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

export const ListJobType = ({userJobType, listJobTypeID, SetListJobTypeID}) => {
    const jobTypes = userJobType
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
    const [listJobType, setListJobType] = React.useState([]);

    const handleChange = (event) => {
        const {
        target: { value },
        } = event;
        setListJobType(
        // On autofill we get a stringified value.
        typeof value === 'string' ? value.split(',') : value,
        );
        var tempListJobType = typeof value === 'string' ? value.split(',') : value
        var result=tempListJobType.map(name=>{
            var result_check=jobTypes.find((i_name)=>{
                return i_name.Job_Name === name
            })
            return result_check.Job_ID
        })
        SetListJobTypeID(result)
    };
    return (
        <div>
        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-multiple-checkbox-label">Công việc</InputLabel>
            <Select
            labelId="demo-multiple-checkbox-label"
            id="demo-multiple-checkbox"
            multiple
            value={listJobType}
            onChange={handleChange}
            input={<OutlinedInput label="Công việc" />}
            renderValue={(selected) => selected.join(', ')}
            MenuProps={MenuProps}
            >
            {jobTypes.map((jobType) => (
                <MenuItem key={jobType.Job_Name} value={jobType.Job_Name}>
                <Checkbox checked={listJobType.indexOf(jobType.Job_Name) > -1}/>
                <ListItemText primary={jobType.Job_Name} />
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
            <InputLabel id="demo-multiple-checkbox-label">Hình thức làm việc</InputLabel>
            <Select
                labelId="demo-multiple-checkbox-label"
                id="demo-simple-select"
                value={FormWorking}
                onChange={handleChangeWorkingForm}
                input={<OutlinedInput label="Hình thức làm việc" />}
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
        'Nam',
        'Nữ',
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
            <InputLabel id="demo-multiple-checkbox-label">Giới tính</InputLabel>
            <Select
                labelId="demo-multiple-checkbox-label"
                id="demo-simple-select"
                value={gender}
                onChange={handleChangeGender}
                input={<OutlinedInput label="Giới tính" />}
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


// export const TableJobApplied = () => {
//     const [jobApplied, setJobApplied] = React.useState([]);
//     React.useEffect(() => {
//         axios.get('http://localhost:3001/candidate/job-applied',
//         {
//             withCredentials: true
//         }).then((res)=>{
//             setJobApplied(res.data.list)
//         })
//     },[])
//     return(
//         <div>
//             hee
//         </div>
//     );
// }


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
    const [listJobTypeID , SetListJobTypeID ] = React.useState([])
    const [listSkillID, SetListSkillID] = React.useState([])
    const [userType,setUserType] = React.useState('')
    const [skills,setSkills] = React.useState([])
    const [interests,setInterest] = React.useState([])
    const [rank,setRank] = React.useState([])

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
    console.log(rank)
    const handleUpdate = () => {
        if(userType === 'candidate'){
            console.log(listSkillID)
            axios.put('http://localhost:3001/candidate/profile',{
                'candidate-name':CandidateName,
                'date-of-birth':DateOfBirth,
                gender:Gender,
                'phone-number':PhoneNumber,
                about:About,
                'apply-position':listJobTypeID,
                'working-form':WorkingForm,
                'interest-id':listInterestID,
                'skill-id':listSkillID,
                'rank': [5,4,3]
            },
            {
            withCredentials: true
            }).then((res)=>{
                console.log(res)
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
                    <span class="field__label">Họ và tên</span>
                </span>
            </label>

            <label class="field field_v3">
                <input class='field__input' type="text" name='phone-number' placeholder={curInfo.Phone_Number} onChange={(e) => {
                    SetPhoneNumber(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Số điện thoại</span>
                </span>
            </label>


            <label class="field field_v3">
                <input class='field__input' type="text" name='date-of-birth' placeholder={curInfo.DateOfBirth} onChange={(e) => {
                    SetDateOfBirth(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Ngày sinh</span>
                </span>
            </label>

            <label class="field field_v3">
                <input class='field__input' type="text" name='about' placeholder={curInfo.About} onChange={(e) => {
                    SetAbout(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Về bản thân</span>
                </span>
            </label>
            <ListInterestsForUser userInterest = {interests} listInterestID = {listInterestID} SetListInterestID = {SetListInterestID} />
            <ListSkillsForUser userSkill = {skills}  listSkillID = {listSkillID} SetListSkillID = {SetListSkillID} setRank={setRank}/>
            <ListJobType userJobType = {JobType}  listJobTypeID = {listJobTypeID} SetListJobTypeID = {SetListJobTypeID}/>
            <ListWorkingForm SetWorkingForm={SetWorkingForm}/>
            <GenderForm SetGender = {SetGender}/>
            <div className="button" onClick={handleUpdate}>
                Update
            </div>
        </div>
    )
} 
export default UpdateFormCandidate