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
import Stack from '@mui/material/Stack';
import TextField from '@mui/material/TextField';
import AdapterDateFns from '@mui/lab/AdapterDateFns';
import LocalizationProvider from '@mui/lab/LocalizationProvider';
import DesktopDatePicker from '@mui/lab/DesktopDatePicker';
import MuiAlert from '@mui/material/Alert';
import Snackbar from '@mui/material/Snackbar';
import Grid from '@mui/material/Grid';
import CircularProgress from '@mui/material/CircularProgress';
export const  DatePicker = ({setStartDate, setEndDate}) => {
    const [start, setStart] = React.useState(new Date());
    const [end, setEnd] = React.useState(new Date());
    const handleChangeStart = (newValue) => {
        setStart(newValue);
    };
    setStartDate(`${start.getUTCFullYear()}-${start.getUTCMonth()+1}-${start.getUTCDate()}`)
    const handleChangeEnd = (newValue) => {
        setEnd(newValue);
    };
    setEndDate(`${end.getUTCFullYear()}-${end.getUTCMonth()+1}-${end.getUTCDate()}`)
    
    return (
      <LocalizationProvider dateAdapter={AdapterDateFns}>
        <Stack spacing={3}>
          <DesktopDatePicker
            label="Ngày bắt đầu tuyển dụng"
            inputFormat="MM/dd/yyyy"
            value={start}
            onChange={handleChangeStart}
            renderInput={(params) => <TextField {...params} />}
          />
          </Stack>
        <br></br>
          <Stack spacing={3}>
          <DesktopDatePicker
            label="Ngày kết thúc tuyển dụng"
            inputFormat="MM/dd/yyyy"
            value={end}
            onChange={handleChangeEnd}
            renderInput={(params) => <TextField {...params} />}
          />
          </Stack>
    </LocalizationProvider>
  );
}
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
        setJobType(event.target.value)
        arrTypes.map(item=>{
            if(item.Type_Name === event.target.value){
                setTypeJobID(item.Type_ID)
            }
        })
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
        <br></br>
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
        <br></br>
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
        <br></br>
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
        <br></br>
            <FormControl sx={{ m: 1, width: 300 }}>
            <InputLabel id="demo-simple-select-label">Type Job</InputLabel>
            <Select 
                labelId="demo-simple-select-label"
                id="demo-simple-checkbox"
                value={jobType}
                onChange={handleChangeTypeJob}
                input={<OutlinedInput label="Type Job" />}
                >
                {
                    arrTypes.map((type) => {
                        return (
                            <MenuItem value={type.Type_Name}>
                                {type.Type_Name}
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
    const [submit,setSubmit] = React.useState(false)
    const [open, setOpen] = React.useState(false);
    const [description,setDescription] = React.useState("");
    var arrDescription = []
    description.split('\n').map(item=>{
        arrDescription.push(item)
    })
    const Alert = React.forwardRef(function Alert(props, ref) {
        return <MuiAlert elevation={6} ref={ref} variant="filled" {...props} />;
      });
    const handleClose = (event, reason) => {
        if (reason === 'clickaway') {
          return;
        }
        setOpen(false);
      };
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
            
        })
    },[])
    const handleCreateJob = () => {
        setSubmit(true)

        if(parseInt(salary)<0 || isNaN(Number(salary))|| parseInt(recruimentQuantity)<0 || isNaN(Number(recruimentQuantity))|parseInt(yearExperience)<0 || isNaN(Number(yearExperience))){
            setSubmit(false)
            alert('Incorrect input')
        }
        if((jobName&&salary&&startDate&&endDate&&district&&city.name&&workingForm&&recruimentQuantity&&listSkillsID)&&(parseInt(salary)>0)&&(parseInt(yearExperience)>0)&&(parseInt(recruimentQuantity)>0)){
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
                description: arrDescription
            },
            {
                withCredentials: true
            }).then((res)=>{
                setSubmit(false)
                setOpen(true);
                setTimeout(() => {
                    window.location.href="/profile"
                }, 1000); 
            })
        }
        if(!(jobName&&salary&&startDate&&endDate&&district&&city.name&&workingForm&&recruimentQuantity&&listSkillsID)) {
            setSubmit(false)
            alert('please fill all blank')
        }
        console.log(typeJob)
        
    }

    return (
        <div className='create_job_container'>
            {
                console.log(Number(salary))
            }
            <label class="field field_v3">
                <input class='field__input' type="text" name='job-name' placeholder={"e.g: Data Science"} onChange={(e) => {
                    setJobName(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Tên công việc</span>
                </span>
            </label>
            <br></br>
            <label class="field field_v3">
                <input class='field__input' type="text" name='salary' placeholder={"e.g: 15000000"} onChange={(e) => {
                    setSalary(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Tiền lương</span>
                </span>
            </label>
            <br></br>
            <label class="field field_v3">
                <input class='field__input' type="text" name='recruitment_quantity' placeholder={"e.g: 2"} onChange={(e) => {
                    setRecruitmentQuantity(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Số lượng tuyển</span>
                </span>
            </label>
            <br></br>
            <label class="field field_v3">
                <input class='field__input' type="text" name='years-of-experience' placeholder={"e.g: 2"} onChange={(e) => {
                    setYearExperience(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Kinh nghiệm làm việc</span>
                </span>
            </label>
            <br></br>
            <label for="w3review">Description</label>
            <textarea id="w3review" name="description" rows="4" cols="50" onChange={(e)=>{
                setDescription(e.target.value)
            }}>
            </textarea>
            <br></br>
            <DatePicker setStartDate = {setStartDate} setEndDate = {setEndDate} />
            <Filter listCity = {listCity} Type = {Type} SetWorkingForm = {SetWorkingForm} setCity = {setCity} setDistrict = {setDistrict} listSkills={listSkills} setListSkillsID = {setListSkillsID} setTypeJobID={setTypeJobID}/>
            <div className="button" onClick={handleCreateJob}>
                {
                    submit?
                    <CircularProgress style={{"color":"white"}}/>
                    :
                    <>Create Job</>
                }
            </div>
                <Snackbar
                    open={open}
                    autoHideDuration={6000}
                    onClose={handleClose}
                >
                    <Alert onClose={handleClose} severity="success" sx={{ width: '100%' }}>
                        Create job successfully
                        </Alert>
                </Snackbar>
        </div>
    )
}

export default CreateJobForm
