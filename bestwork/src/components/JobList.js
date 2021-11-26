import React from 'react'
import './css/JobList.scss'
import Slider from '@mui/material/Slider';
import Box from '@mui/material/Box';
import Switch from '@mui/material/Switch';
import Pagination from '@mui/material/Pagination';
import RoomIcon from '@mui/icons-material/Room';
import CreditCardSharpIcon from '@mui/icons-material/CreditCardSharp';
import NotesIcon from '@mui/icons-material/Note';
import Skeleton from '@mui/material/Skeleton';

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
    function valuetext(value) {
        return `${value}°C`;
      }
    const handleChangeSalary = (event, newValue) => {
        setsalaryRange(newValue);
    };
    const handleChangeRemote = (event) => {
        setCheckedRemote(event.target.checked);
    };
    return (
        <div className="filter_container">
            Salary:
            <Box sx={{ width: 300 }}>   
            <Slider
                getAriaLabel={() => 'Temperature range'}
                value={salaryRange}
                onChange={handleChangeSalary}
                valueLabelDisplay="auto"
                getAriaValueText={valuetext}
            />
            </Box>
            <Switch
                checked={checkedRemote}
                onChange={handleChangeRemote}
                inputProps={{ 'aria-label': 'controlled' }}
                />
        </div>
    )
}

export const List = () => {
    const list=[
        {
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
            <Pagination style={{"color":"white"}} count={totalPage} page={page} defaultPage={1} onChange={handleChangePage} />
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
    return(
        <div className="item">
            <img src={JobItem.img} alt="" />
            <div className="info">
                <div className="name">{`${JobItem.position} [ ${JobItem.required} ]`}</div>
                <div className="company">{JobItem.company}</div>
                <div className="salary"><CreditCardSharpIcon/>{`${JobItem.salary}$`}</div>
                <div className="address"><RoomIcon fontSize={"small"}/>{JobItem.address}</div>
                <div className="description"><NotesIcon/>{JobItem.description}</div>
            </div>
        </div>
    )
}