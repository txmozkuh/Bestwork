import React, { useEffect } from 'react'
import './css/CreateJobForm.css'
import axios from 'axios'


import OutlinedInput from '@mui/material/OutlinedInput';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import ListItemText from '@mui/material/ListItemText';
import Select from '@mui/material/Select';
import Checkbox from '@mui/material/Checkbox';



export const Filter = ({listCity,SetWorkingForm,setCity,setDistrict, listSkills, setListSkillsID,Type,setTypeJobID}) => {
    const working_form = [
        'Full-Time',
        'Part-Time',
      ];

    const cities = listCity
    const skills = listSkills
    const types = Type
    const arrTypes = []
    types.map(item=>{
        item.jobtype.map((i_type)=>{
            arrTypes.push({
                "Type_Name": i_type.Type_Name,
                "Type_ID":i_type.Type_ID
            })
        })
    })
    console.log(arrTypes)
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
    const [jobType, setJobType] = React.useState([]);
    const [listSkillChosen, setListSkillChosen] = React.useState([]);
    const [city, setCityChosen] = React.useState('');
    const [district, setDistrictChosen] = React.useState('');
    const [curDistricts,setCurDistricts] = React.useState([])
    const handleChangeWorkingForm = (event) => {
        setFormWorking(event.target.value)
    };
    SetWorkingForm(FormWorking)
    const handleChangeCity = (event) => {
        setCityChosen(event.target.value);
        
    };
    setCity(city)
    useEffect(()=>{
        setDistrictChosen('')
        setCurDistricts(city.districts)
    },[city])   
    const handleChangeDistrict = (event) => {
        setDistrictChosen(event.target.value);
    };
    setDistrict(district)
    const handleChangeSkill = (event) => {
        const {
        target: { value },
        } = event;
        setListSkillChosen(
        // On autofill we get a stringified value.
        typeof value === 'string' ? value.split(',') : value,
        );
        var tempListSkill = typeof value === 'string' ? value.split(',') : value
        var result=tempListSkill.map(name=>{
            var result=skills.find((i_name)=>{
                return i_name.Skill_Name === name
            })
            return result.Skill_ID
        })
        setListSkillsID(result)
    };
    const handleChangeTypeJob = (event) => {
        const {
            target: { value },
            } = event;
            setJobType(
            // On autofill we get a stringified value.
            typeof value === 'string' ? value.split(',') : value,
            );
            var tempListJobType = typeof value === 'string' ? value.split(',') : value
            var result=tempListJobType.map(name=>{
                var result=arrTypes.find((i_name)=>{
                    return i_name.Type_Name === name
                })
                return result.Type_ID
            })
            setTypeJobID(result)
    }
    return (
        <div>
        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-multiple-checkbox-label">Working Form</InputLabel>
            <Select
                labelId="demo-multiple-checkbox-label"
                id="demo-simple-select"
                value={FormWorking}
                onChange={handleChangeWorkingForm}
                input={<OutlinedInput label="Working Form" />}
                >
                {working_form.map((item) => (
                    <MenuItem key={item} value={item}>
                        {item}
                    </MenuItem>
                ))}
            </Select>
        </FormControl>

        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-simple-select-label">Kỹ Năng</InputLabel>
            <Select
                labelId="demo-simple-select-label"
                id="demo-multiple-checkbox"
                multiple
                value={listSkillChosen}
                onChange={handleChangeSkill}
                input={<OutlinedInput label="Kỹ Năng" />}
                renderValue={(selected) => selected.join(', ')}
                MenuProps={MenuProps}
                >
                {skills.map((skill) => (
                    <MenuItem key={skill.Skill_Name} value={skill.Skill_Name}>
                    <Checkbox checked={listSkillChosen.indexOf(skill.Skill_Name) > -1}/>
                    <ListItemText primary={skill.Skill_Name} />
                    </MenuItem>
                ))}
            </Select>
        </FormControl>

        <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-simple-select-label">City</InputLabel>
                <Select
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={city}
                input={<OutlinedInput label="City" />}
                onChange={handleChangeCity}
                
                >
                {cities.map((item) => (
                    <MenuItem value={item}>
                    {item.name}
                    </MenuItem>
                    
                ))}
            </Select>
        </FormControl>
        <FormControl sx={{ m: 1, width: 300 }} disabled={city?false:true}>
            <InputLabel id="demo-simple-select-label">District</InputLabel>
                <Select
                    labelId="demo-simple-select-label"
                    id="demo-simple-select"
                    value={district}
                    input={<OutlinedInput label="District" />}
                    onChange={handleChangeDistrict}
                    >
                    {curDistricts &&
                        curDistricts.map( item => {
                            return <MenuItem value={item.name}>{item.name}</MenuItem>
                        })
                    }
                </Select>
        </FormControl>
            <FormControl sx={{ m: 1, minWidth: 120 }}>
            <InputLabel id="demo-multiple-checkbox-label">Type Job</InputLabel>
            <Select 
                labelId="demo-multiple-checkbox-label"
                id="demo-multiple-checkbox"
                multiple
                value={jobType}
                onChange={handleChangeTypeJob}
                input={<OutlinedInput label="Type Job" />}
                renderValue={(selected) => selected.join(', ')}
                MenuProps={MenuProps}
                >
                {
                    arrTypes.map((type) => {
                        return (
                            <MenuItem id={type.Type_ID} value={type.Type_Name}>
                            <Checkbox checked={jobType.indexOf(type.Type_Name) > -1}/>
                            <ListItemText primary={type.Type_Name} />
                            </MenuItem>
                        )
                                            
                   })
                }
            </Select>
        </FormControl>
        </div>
    );
}
const CreateJobForm = () => {
    const [jobName, setJobName] = React.useState('')
    const [salary, setSalary] = React.useState('')
    const [startDate, setStartDate] = React.useState('')
    const [endDate, setEndDate] = React.useState('')
    const [district, setDistrict] = React.useState('')
    const [city, setCity] = React.useState('')
    const [workingForm, SetWorkingForm] = React.useState('')
    const [recruimentQuantity, setRecruitmentQuantity] = React.useState('')
    const [remote, setRemote] = React.useState('')
    const [yearExperience, setYearExperience] = React.useState('')
    const [typeJob, setTypeJobID] = React.useState([])
    const [listSkillsID, setListSkillsID] = React.useState([])

    const [listCity, getListCity] = React.useState([])
    const [Type, getTypeJob] = React.useState([])
    const [listSkills, getListSkills] = React.useState([])

    React.useEffect(() => {
        axios.get("https://provinces.open-api.vn/api/?depth=2")
        .then((response) =>{
            getListCity(response.data)

        });
        axios.get('http://localhost:3001/get/skill',
        {
            withCredentials: true
        }).then((res)=>{
            getListSkills(res.data.skills)
        })
        axios.get('http://localhost:3001/get/job',
        {
            withCredentials: true
        }).then((res)=>{
            // console.log(res)
            getTypeJob(res.data.jobs)
        })
        axios.get('http://localhost:3001/recruiter/job-list',
        {
        withCredentials: true
        }).then((res)=>{
            console.log('job:' , res)
        })
    },[])
    const handleCreateJob = () => {
        if(jobName&&salary&&startDate&&endDate&&district&&city.name&&workingForm&&recruimentQuantity&&listSkillsID){
            axios.post('http://localhost:3001/recruiter/job-create',{
                'job-name': jobName,
                salary: salary,
                'start-date': startDate,
                'end-date':endDate,
                district: district,
                city: city.name,
                'working-form': workingForm,
                'recruitment_quantity': recruimentQuantity,
                'remote':true,
                'years-of-experience':yearExperience,
                'type-id':typeJob,
                'skill-id':listSkillsID,
            },
            {
                withCredentials: true
            }).then((res)=>{
                console.log(res)
            })
        }
        else {
            alert('please fill all blank')
        }
        console.log(typeJob)
        
    }

    return (
        <div className='create_job_container'>
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Tạo công việc</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Tên công việc</td>
                                <input type="text" name='job-name' defaultValue={'...'} onChange={(e) => {
                                    setJobName(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Mức Lương</td>
                                <input type="text" name='phone-number' defaultValue={'...'} onChange={(e) => {
                                    setSalary(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Ngày bắt đầu tuyển dụng</td>
                                <input type="text" name='startDate' defaultValue={'...'} onChange={(e) => {
                                    setStartDate(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Ngày kết thúc tuyển dụng</td>
                                <input type="text" name='endDate' defaultValue={'...'} onChange={(e) => {
                                    setEndDate(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Số lượng tuyển</td>
                                <input type="text" name='recruitment-quantity' defaultValue={'...'} onChange={(e) => {
                                    setRecruitmentQuantity(e.target.value)
                                }}></input>
                            </tr>
                            <tr>
                                <td>Kinh nghiệm</td>
                                <input type="text" name='years-of-experience' defaultValue={'...'} onChange={(e) => {
                                    setYearExperience(e.target.value)
                                }}></input>
                            </tr>
                        </tbody>
                    </table>
                    <Filter listCity = {listCity} Type = {Type} SetWorkingForm = {SetWorkingForm} setCity = {setCity} setDistrict = {setDistrict} listSkills={listSkills} setListSkillsID = {setListSkillsID} setTypeJobID={setTypeJobID}/>
                    <div className="button" onClick={handleCreateJob}>
                        Create Job
                    </div>
        </div>
    )
}

export default CreateJobForm
