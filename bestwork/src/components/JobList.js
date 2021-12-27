import React, { useEffect, useState } from 'react'
import './css/JobList.scss'
import JobDetail from './JobDetail.js'
import { Redirect } from "react-router-dom";
import {
    Link
} from "react-router-dom";
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

const JobList = () => {
    return (
        <div className="joblist_container">
            <div className="bg"/>
            <div className="box">
                <List/>
                <Filter/>
            </div>
        </div>
    )
}
export default JobList

export const Filter = () => {
    const [salaryRange, setsalaryRange] = React.useState([20, 37]);
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
                        console.log(cities["0"])
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
        </div>
    )
}

export const List = () => {
    const [listJob,setListJob] = useState([]);
    useEffect(() => {
        axios.get('http://localhost:3001/candidate/job-list',
        {
            withCredentials: true
        }).then((res)=>{console.log(res)})
    })
    const list=[
        {
            id:"123asd123123",
            img:"./images/gg.png",
            company:"ATOM",
            required:"Reactjs Javascript",
            position:"Front-end developer ",
            salary:"500",
            address:"100 NTMK Quan 3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"REUS",
            required:"Nodejs, ExpressJs,ElectronicJs",
            position:"Back-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"HERA",
            required:"IT",
            position:"FullStack developer",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },{
            img:"./images/gg.png",
            company:"ATOM",
            required:"Reactjs Javascript",
            position:"Front-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"REUS",
            required:"Nodejs, ExpressJs,ElectronicJs",
            position:"Back-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"HERA",
            required:"IT",
            position:"FullStack developer",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },{
            img:"./images/gg.png",
            company:"ATOM",
            required:"Reactjs Javascript",
            position:"Front-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"REUS",
            required:"Nodejs, ExpressJs,ElectronicJs",
            position:"Back-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"HERA",
            required:"IT",
            position:"FullStack developer",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },{
            img:"./images/gg.png",
            company:"ATOM",
            required:"Reactjs Javascript",
            position:"Front-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"REUS",
            required:"Nodejs, ExpressJs,ElectronicJs",
            position:"Back-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"HERA",
            required:"IT",
            position:"FullStack developer",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },{
            img:"./images/gg.png",
            company:"ATOM",
            required:"Reactjs Javascript",
            position:"Front-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"REUS",
            required:"Nodejs, ExpressJs,ElectronicJs",
            position:"Back-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"HERA",
            required:"IT",
            position:"FullStack developer",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },{
            img:"./images/gg.png",
            company:"ATOM",
            required:"Reactjs Javascript",
            position:"Front-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"REUS",
            required:"Nodejs, ExpressJs,ElectronicJs",
            position:"Back-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"HERA",
            required:"IT",
            position:"FullStack developer",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },{
            img:"./images/gg.png",
            company:"ATOM",
            required:"Reactjs Javascript",
            position:"Front-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"REUS",
            required:"Nodejs, ExpressJs,ElectronicJs",
            position:"Back-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"HERA",
            required:"IT",
            position:"FullStack developer",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },{
            img:"./images/gg.png",
            company:"ATOM",
            required:"Reactjs Javascript",
            position:"Front-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"REUS",
            required:"Nodejs, ExpressJs,ElectronicJs",
            position:"Back-end developer ",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        },
        {
            img:"./images/gg.png",
            company:"HERA",
            required:"IT",
            position:"FullStack developer",
            salary:"500",
            address:"100 NTMK Q3",
            description:"We are looking a great Front-end developer",
        }
    ]
    const [page,setPage]=React.useState(1)
    const itemPerPage=10
    const totalPage=Math.ceil(list.length/itemPerPage)
    const handleChangePage = (event, newPage) => {
        setPage(newPage);
    };
    
    return (
        <div className="list_container"> 
            <Pagination style={{"color":"white"}} count={totalPage} page={page} onChange={handleChangePage}/>
            {
                list.slice((page-1)*10,(page-1)*10+10).map((item)=>{
                    return <JobItem item={item}/>
                })
            }
        </div>
    )
}
export const JobItem = (props) =>{
    const JobItem=props.item
    const navigate = useNavigate();
    function handleClick() {
        navigate(`/job/item/${JobItem.id}`);
    }
    return(
        // <Link to ={`/item`}> 
            <div className="item" onClick={handleClick}>
                <img src={JobItem.img} alt="" />
                <div className="info">
                    <div className="name">{`${JobItem.position} [ ${JobItem.required} ]`}</div>
                    <div className="company"><BusinessIcon/>{JobItem.company}</div>
                    <div className="salary"><CreditCardSharpIcon/>{`${JobItem.salary}$`}</div>
                    <div className="address"><RoomIcon fontSize={"small"}/>{JobItem.address}</div>
                    <div className="description"><NotesIcon/>{JobItem.description}</div>
                </div>
            </div>
        // </Link>
    )
}