import React, { useEffect, useState } from 'react'
import './css/JobList.scss'
import {useParams} from 'react-router-dom'
import { useNavigate } from 'react-router-dom';
import Slider from '@mui/material/Slider';
import Box from '@mui/material/Box';
import Switch from '@mui/material/Switch';
import Pagination from '@mui/material/Pagination';
import BusinessIcon from '@mui/icons-material/Business';
import RoomIcon from '@mui/icons-material/Room';
import CreditCardSharpIcon from '@mui/icons-material/CreditCardSharp';
import NotesIcon from '@mui/icons-material/Note';
import Select from '@mui/material/Select';
import MenuItem from '@mui/material/MenuItem';
import InputLabel from '@mui/material/InputLabel';
import FormControl from '@mui/material/FormControl';
import axios from "axios"
import Skeleton from '@mui/material/Skeleton';
import Stack from '@mui/material/Stack';
import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';
const JobList = () => {
    return (
        <div className="joblist_container">
            <div className="bg"/>
            <div className="box">
                <List filter={localStorage.getItem("filter")}/>
                <Filter/>
            </div>
        </div>
    )
}
export default JobList

export const Filter = () => {
    const [list, setList] = React.useState([])
    const [jobName, setJobName] = React.useState("");
    const [salaryRange, setsalaryRange] = React.useState([0, 50000000]);
    const [checkedRemote, setCheckedRemote] = React.useState(false);
    const [type, setType] = React.useState('')
    const [city, setCity]= React.useState('')
    const [district, setDistrict]= React.useState('')
    const [cities, getCities]= React.useState([])
    let curDistricts=[]
    React.useEffect(()=>{
        callApi()
            //request as guest
        axios.get('http://localhost:3001/guest/job-list',
        {
            withCredentials: true
        }).then((res)=>{
            setList(res.data.list)
        })
            
    },[])

    function valuetext(value) {
        return `${value}$`;
      }
    const handleJobName = (e,value) =>{
        if(value){
            setJobName(value)
        }
    }
    const handleChangeSalary = (event, newValue) => {
        setsalaryRange(newValue);
    };
    const handleChangeRemote = (event) => {
        setCheckedRemote(event.target.checked);
    };
    const handleChangeType = (event) => {
        setType(event.target.value)
    }
    const handleChangeCity = event => {
        setCity(event.target.value)
    }
    const handleChangeDistrict = event => {
        setDistrict(event.target.value)
    }
    const handleFilter = () => {
        localStorage.setItem("filter",JSON.stringify({
            "job":jobName,
            "min": salaryRange[0],
            "max": salaryRange[1],
            "remote": checkedRemote
        }))
        window.location.reload()
    }
    const [jobType,getJobType]=React.useState([])
    function callApi(){
        axios.get("https://provinces.open-api.vn/api/?depth=2")
        .then((response) =>{
            getCities(response.data)
        });
        axios.get('http://localhost:3001/get/job',
        {
            withCredentials: true
        }).then((res)=>{
            getJobType(res.data.jobs)
        })
    }   
    return (
        <div className="filter_container">
            <Autocomplete
                disablePortal
                id="combo-box-demo"
                options={list.map(item=>{return item.Job_Name})}
                sx={{ width: 300 }}
                renderInput={(params) => <TextField {...params} label="Job" />}
                onChange={handleJobName}
            />
            
                {/* <FormControl fullWidth >
                <InputLabel id="demo-simple-select-label">Type</InputLabel>
                <Select
                    labelId="demo-simple-select-label"
                    id="demo-simple-select"
                    value={type}
                    label="Age"
                    onChange={handleChangeType}
                    >
                    {
                        jobType.map((type)=>{
                            return <MenuItem value={type.Job_Name}>{type.Job_Name}</MenuItem>
                    })
                    }
                </Select>
                </FormControl> */}
                <FormControl sx={{width:300}}>
                <InputLabel id="demo-simple-select-label">City</InputLabel>
                <Select
                    labelId="demo-simple-select-label"
                    id="demo-simple-select"
                    value={city}
                    label="City"
                    onChange={handleChangeCity}
                    >
                    {
                        cities.map( city => {
                            return <MenuItem value={city.name}>{city.name}</MenuItem>
                        })
                    }
                </Select>
                </FormControl>
                <FormControl sx={{width:300}} disabled={city?false:true}>
                <InputLabel id="demo-simple-select-label">District</InputLabel>
                <Select
                    labelId="demo-simple-select-label"
                    id="demo-simple-select"
                    value={district}
                    label="Age"
                    onChange={handleChangeDistrict}
                    >
                    {
                        curDistricts.map( district => {
                            return <MenuItem value={district}>{district}</MenuItem>
                        })
                    }
                </Select>
                </FormControl>
                <Box sx={{ width: 300 }}>   
                Salary:
                <Slider
                    getAriaLabel={() => 'Salary range'}
                    min={0}
                    max={100000000}
                    step={100000}
                    value={salaryRange}
                    onChange={handleChangeSalary}
                    valueLabelDisplay="auto"
                    getAriaValueText={valuetext}
                />
                </Box>
                <Box className="remote">
                    <span>Remote:</span>
                    <Switch
                        checked={checkedRemote}
                        onChange={handleChangeRemote}
                        inputProps={{ 'aria-label': 'controlled' }}
                    />
                </Box>
                
            <div className="filter_btn" onClick={handleFilter}>Search</div>
        </div>
    )
}

export const List = () => {
    const {searchValue} = useParams();
    const [filter, setFilter] = React.useState(JSON.parse(localStorage.getItem("filter")))
    const [noResult, setNoResult] = React.useState(false)
    const [loaded, setLoaded] = React.useState(true)
    const [listJob,setListJob] = useState([]);
    const userType =localStorage.getItem('user_status')
    useEffect(() => {
        if(searchValue)
        {
            //Search request
            axios.get(`http://localhost:3001/search?job-name=${searchValue}&district=6&city=&salary=0&salary=28000000&remote=`,
            {
                withCredentials: true
            }).then((res)=>{
                if(res.data.list.length===0)
                {
                    setNoResult(true)
                }
                else{
                    setListJob(res.data.list)
                }
                setLoaded(false)
            })
        }
        if(filter)
        {
            //Search request
            axios.get(`http://localhost:3001/search?job-name=${filter.job}&district=&city=&salary=${filter.min}&salary=${filter.max}&remote=${filter.remote?1:0}`,
            {
                withCredentials: true
            }).then((res)=>{
                if(res.data.list.length===0)
                {
                    setNoResult(true)
                }
                else{
                    setListJob(res.data.list)
                }
                localStorage.clear("filter")
                setLoaded(false)
            })
        }
        else
        {
            //request as candidate
            if(userType ==='candidate'){
                axios.get('http://localhost:3001/candidate/job-list',
                {
                    withCredentials: true
                }).then((res)=>{
                    setListJob(res.data.list)
                    setLoaded(false)
                })
            }
            else{
            //request as guest
                axios.get('http://localhost:3001/guest/job-list',
                {
                    withCredentials: true
                }).then((res)=>{
                    setListJob(res.data.list)
                    setLoaded(false)
                })
            }
        }
        
    },[])
    const [page,setPage]=React.useState(1)
    const itemPerPage=10
    const totalPage=Math.ceil(listJob.length/itemPerPage)
    const handleChangePage = (event, newPage) => {
        setPage(newPage);
    };
    return (
        <div className="list_container"> 
            {noResult?<></>:<Pagination style={{"color":"white"}} count={totalPage} page={page} onChange={handleChangePage}/>}
            {
                loaded?
                    <Stack spacing={1}>
                    <Skeleton variant="rectangular" height={190} />
                    <Skeleton variant="rectangular" height={190} />        
                    <Skeleton variant="rectangular" height={190} />        
                    <Skeleton variant="rectangular" height={190} />        
                    <Skeleton variant="rectangular" height={190} />        
                    <Skeleton variant="rectangular" height={190} />                
                    </Stack>
                    :
                        noResult?
                        <EmptyPage searchValue={searchValue}/>
                        :
                        listJob.slice((page-1)*10,(page-1)*10+10).map((item)=>{
                            return <JobItem item={item}/>
                        })
                    }
        </div>
    )
    
}
export const JobItem = (props) =>{
    const [userstatus, setUserStatus] = React.useState("")
    React.useEffect(()=>{
        setUserStatus(localStorage.getItem('user_status'))
    },[])
    const JobItem=props.item
    const navigate = useNavigate();
    function handleClick() {
        navigate(`/job/item/${JobItem.Recruiter_Job_ID}`);
    }
    return(
            <div className="item" onClick={handleClick}>
                    <img src="/images/company.png" alt="" />
                    <div className="info">
                        <div className="name item_attribute">{`${JobItem.Job_Name}`}</div>
                        <div className="company item_attribute"><BusinessIcon/>  &nbsp;{JobItem.Recruiter_Name}</div>
                        <div className="salary item_attribute"><CreditCardSharpIcon/>  &nbsp;{`${JobItem.Salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')} VND`}</div>
                        <div className="address item_attribute"><RoomIcon fontSize={"small"}/>  &nbsp;{JobItem.District} {JobItem.city}</div>
                        <div className="description item_attribute"><NotesIcon/> &nbsp;{JobItem.Working_Form}</div>
                        
                    </div>
            </div>
    )
}

export const EmptyPage = (props) =>{
    return (
        <div className="empty_container">
            <h1>NO RESULT for "{props.searchValue}"</h1>
            <img src="./images/no_result.png" alt='Not found'/>
        </div>
    )
}