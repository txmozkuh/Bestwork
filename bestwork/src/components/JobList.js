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
    const [salaryRange, setsalaryRange] = React.useState([0, 100000000]);
    const [checkedRemote, setCheckedRemote] = React.useState(false);
    const [type, setType] = React.useState('')
    const [city, setCity]= React.useState('')
    const [district, setDistrict]= React.useState('')
    let curDistricts=[]
    React.useEffect(()=>{
        callApi()
    },[])

    function valuetext(value) {
        return `${value}$`;
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
            "min": salaryRange[0],
            "max": salaryRange[1],
            "remote": checkedRemote
        }))
        window.location.reload()
    }
    const fakeJobType=["IT","IT1","IT2","IT3"]
    var cities=[]
    function callApi(){
        axios.get("https://api.mysupership.vn/v1/partner/areas/province")
        .then((response) =>{
            for(var i in response.data.results){
                cities[i]= response.data.results[i]
            }
        });
    }   
    return (
        <div className="filter_container">
            Salary:
            <Box sx={{ width: 300 }}>   
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
            <Box sx={{ width: 300 }}>
                <FormControl fullWidth >
                <InputLabel id="demo-simple-select-label">Type</InputLabel>
                <Select
                    labelId="demo-simple-select-label"
                    id="demo-simple-select"
                    value={type}
                    label="Age"
                    onChange={handleChangeType}
                    >
                    {
                        fakeJobType.map((type)=>{
                            return <MenuItem value={type}>{type}</MenuItem>
                    })
                    }
                </Select>
                </FormControl>
                <FormControl fullWidth>
                <InputLabel id="demo-simple-select-label">City</InputLabel>
                <Select
                    labelId="demo-simple-select-label"
                    id="demo-simple-select"
                    value={city}
                    label="City"
                    onChange={handleChangeCity}
                    >
                    {
                        // cities.map( city => {
                        //     // return <MenuItem value={city}>{city}</MenuItem>
                        //     console.log(city)
                        // })
                    }
                </Select>
                </FormControl>
                <FormControl fullWidth disabled={city?false:true}>
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
                if(res.data.list.length==0)
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
            console.log(filter)
            //Search request
            axios.get(`http://localhost:3001/search?job-name=&district=&city=&salary=${filter.min}&salary=${filter.max}&remote=`,
            {
                withCredentials: true
            }).then((res)=>{
                if(res.data.list.length==0)
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
            <img src="./images/no_result.png"/>
        </div>
    )
}