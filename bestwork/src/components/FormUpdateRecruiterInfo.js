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
import CircularProgress from '@mui/material/CircularProgress';
import Snackbar from '@mui/material/Snackbar';
import MuiAlert from '@mui/material/Alert';
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
            <InputLabel id="demo-simple-select-label">Thành phố</InputLabel>
                <Select
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={city}
                input={<OutlinedInput label="Thành phố" />}
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
            <InputLabel id="demo-simple-select-label">Quận</InputLabel>
                <Select
                    labelId="demo-simple-select-label"
                    id="demo-simple-select"
                    value={district}
                    input={<OutlinedInput label="Quận" />}
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
    const [submit,setSubmit] = React.useState(false)
    const [open, setOpen] = React.useState(false);

    const Alert = React.forwardRef(function Alert(props, ref) {
        return <MuiAlert elevation={6} ref={ref} variant="filled" {...props} />;
      });
    const handleClick = () => {
      setOpen(true);
    };
    const handleClose = (event, reason) => {
      if (reason === 'clickaway') {
        return;
      }
  
      setOpen(false);
    };
    useEffect(() => {
        axios.get("https://provinces.open-api.vn/api/?depth=2")
        .then((response) =>{
            getListCity(response.data)
        });
    },[])
    
    const handleUpdate = () => {
        setSubmit(true)
        if (recruiterName&&city&&district&&tax){
            
            axios.put('http://localhost:3001/recruiter/profile',{
                'recruiter-name':recruiterName,
                district:district,
                city:city.name,
                tax: tax
                },
                {
                withCredentials: true
            }).then((res)=>{
                handleClick()
                setSubmit(false)
                localStorage.setItem("user_name",recruiterName)
                setTimeout(() => {
                    window.location.href="/profile"
                }, 1000);

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
                    setTax(e.target.value)
                }}></input>
                <span class="field__label-wrap">
                    <span class="field__label">Thuế</span>
                </span>
            </label>
            <Filter listCity = {listCity} setCity = {setCity} setDistrict = {setDistrict}/>
            <div className="button" onClick={handleUpdate}>
                {
                    submit?
                    <CircularProgress style={{"color":"white"}}/>
                    :
                    <>Update profile</>
                }
                <Snackbar
                    open={open}
                    autoHideDuration={6000}
                    onClose={handleClose}
                >
                    <Alert onClose={handleClose} severity="success" sx={{ width: '100%' }}>
                        Update successfully
                        </Alert>
                </Snackbar>
            </div>
        </div>
    )
} 
export default UpdateFormRecruiter