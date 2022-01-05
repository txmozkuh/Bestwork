import './css/Profile.css'
import './css/CreateJobForm.css'
import axios from 'axios'
import React, { useEffect } from 'react'
import OutlinedInput from '@mui/material/OutlinedInput';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import ListItemText from '@mui/material/ListItemText';
import Select from '@mui/material/Select';
import Checkbox from '@mui/material/Checkbox';

export const Filter = ({listCity, setCity,setDistrict}) => {
    const cities = listCity
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
    const [city, setCityChosen] = React.useState('');
    const [district, setDistrictChosen] = React.useState('');
    const [curDistricts,setCurDistricts] = React.useState([])
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
    return (
        <div>
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
        </div>
    );
}

export const UpdateFormRecruiter = (props) => {
    let curInfo=props.info
    const [recruiterName,setRecruiterName] = React.useState("")
    const [listCity, getListCity] = React.useState([])
    const [city,setCity] = React.useState("")
    const [district,setDistrict] = React.useState("")
    const [tax,setTax] = React.useState("")
    useEffect(() => {
        axios.get("https://provinces.open-api.vn/api/?depth=2")
        .then((response) =>{
            getListCity(response.data)
        });
    },[])
    const handleUpdate = () => {
        if (recruiterName&&city&&district&&tax){
            axios.put('http://localhost:3001/recruiter/profile',{
                'recruiter-name':recruiterName,
                district:district,
                city:city,
                tax: tax
                },
                {
                withCredentials: true
            }).then((res)=>{
                console.log(res)
            })
        }
        else{
            alert("Please fill all blank")
        }
        
    }
    return(
        <div class="profile_container">
            <label class="field field_v3">
                <input class='field__input' type="text" name='recruiter-name' placeholder={curInfo.Recruiter_Name} onChange={(e) => {
                    setRecruiterName(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Tên công ty</span>
                </span>
            </label>

            <label class="field field_v3">
                <input class='field__input' type="text" name='tax' placeholder={curInfo.Tax} onChange={(e) => {
                    setRecruiterName(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Thuế</span>
                </span>
            </label>
            <Filter listCity = {listCity} setCity = {setCity} setDistrict = {setDistrict}/>
            <div className="button" onClick={handleUpdate}>
                Update profile
            </div>
        </div>
    )
} 
export default UpdateFormRecruiter