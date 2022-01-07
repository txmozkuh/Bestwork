import React from 'react';
import {
    Link
} from "react-router-dom";
import './css/Navbar.css'
import SearchIcon from '@mui/icons-material/Search';
import ListIcon from '@mui/icons-material/List';
import Box from "@mui/material/Box";
import Drawer from "@mui/material/Drawer";
import List from '@mui/material/List';
import Divider from '@mui/material/Divider';
import ListItem from '@mui/material/ListItem';
import axios from "axios"

const Header = () => {    
    
    //HANDLE CHECK LOGIN OR NOT?
    const [userStatus, setUserStatus] = React.useState("")
    const [userName, setUserName] = React.useState("")
    React.useEffect(()=>{
        setUserStatus(localStorage.getItem('user_status'))
        setUserName(localStorage.getItem('user_name'))
    },[])
    let navbarElements={
        logo:"images/bwlogo.png",
        links:[
            {
                'title':'Home',
                'link':'/'
            },
            {
                'title':userStatus==="recruiter"?'Create':'Job',
                'link':userStatus==="recruiter"?'/job-add':'/job'
            }
            ,
            {
                'title':'About us',
                'link':'/about-us'
            }
            ,
            {
                'title':'Contact',
                'link':'/contact'
            }
            
        ]
    }
    const handleLogOut = () =>{
        axios.get('http://localhost:3001/auth/logout',
        {
            withCredentials: true
        }).then((res)=>{
            localStorage.clear()
            window.location.href="/"
        })
    }

    const [state, setState] = React.useState({
        top: false
      });
    //
    const toggleDrawer = (anchor, open) => (event) => {
        if (
          event.type === "keydown" &&
          (event.key === "Tab" || event.key === "Shift")
        ) {
          return;
    }
        setState({ ...state, [anchor]: open });
      };
      const lista = (anchor) => (
        <Box
          sx={{ width: anchor === "top" || anchor === "bottom" ? "auto" : 250 }}
          role="presentation"
          onClick={toggleDrawer(anchor, false)}
          onKeyDown={toggleDrawer(anchor, false)}
        >
        <List className = "link_container">
            {
                navbarElements.links.map((element)=>{
                    return <ListItem button> <Link to = {element.link} className = "link"> {element.title} </Link></ListItem>
                })
            }  
        </List>
        <Divider/>
        <List>
        <ListItem button >
            <div className = "login_btn" > Sign In </div>  
        </ListItem>
        </List>
        </Box>
      );
    
    return ( 
        <div className = "navbar" >
            <div className="logo_container"><Link to = "/" className = 'logo' > < img src = {navbarElements.logo} alt = "" /></Link></div>
            <SearchBar/>
            <ul className = "link_container">
                {
                    navbarElements.links.map((element)=>{
                        return <li> <Link to = {element.link} className = "link"> {element.title} </Link></li>
                    })
                }
            <li>
            {
                (userStatus==="candidate" || userStatus==="recruiter")?
                <div className="dropdown">
                    <Link to={'/profile'}><h1>{userName}</h1></Link>
                    <div className='dropdown_box'>
                    <div className='item'><Link to={'/profile'}>Profile</Link></div>
                    <div className='item' onClick={handleLogOut}><Link to={'/'}>Log Out</Link></div>
                    </div>
                </div>
                :
                <Link to={"/sign-in"}><div className = "login_btn" > Sign In </div> </Link>
            }
            </li>
            </ul>
            {
                <React.Fragment key={"top"}>
                <div className = "menu_btn" onClick={toggleDrawer("top", true)}><ListIcon/></div>
                
                <Drawer
                    anchor={"top"}
                    open={state["top"]}
                    onClose={toggleDrawer("top", false)}
                >
                    {lista("top")}
                </Drawer>
                </React.Fragment>
            }
            {/* <div className = "menu_btn">  </div>  */}
        </div>      
    )
}
export default Header

export const SearchBar=()=>{
    const [searchValue, setSearchValue] = React.useState("")
    const handleSearch = (e) =>{
        if(e.key==="Enter")
        {
            window.location.href=`/job/${searchValue}`
        }
    }
    return (
        <div className="searchBar">
            <SearchIcon/>
            <input type="text" onChange={(e)=>{setSearchValue(e.target.value)}} placeholder="Looking for a business?" onKeyPress={handleSearch}/>
        </div>
        
    )
}