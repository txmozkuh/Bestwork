import React from 'react';
import {
    Link
} from "react-router-dom";
import './css/Navbar.css'
import Login from './Login';
import Tooltip from '@mui/material/Tooltip';
import SearchIcon from '@mui/icons-material/Search';
import ListIcon from '@mui/icons-material/List';
import Box from "@mui/material/Box";
import Drawer from "@mui/material/Drawer";
import List from '@mui/material/List';
import Divider from '@mui/material/Divider';
import ListItem from '@mui/material/ListItem';

const Header = () => {
    //HANDLE OPEN LOGIN FORM 
    const [loginForm, setLoginForm] = React.useState(true)
    console.log(`Form stay: ${loginForm?"Close":"Open"}`)
    const handleLoginForm = (value, target) => { //value được truyền từ component Login thông qua func
        setLoginForm(!loginForm)
        loginForm ?
            document.querySelector(".login_layer").style.display = "block" :
            document.querySelector(".login_layer").style.display = "none"
    }
    //HANDLE CHECK LOGIN OR NOT?
    const [isLogin,setLogin]=React.useState(false)
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
            <div className = "login_btn" onClick = { handleLoginForm } > Sign In </div>
        </ListItem>
        </List>
        </Box>
      );
    const navbarElements={
        logo:"images/logonew.png",
        links:[
            {
                'title':'Home',
                'link':'/'
            },
            {
                'title':'Job',
                'link':'/job'
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
    return ( 
        <div className = "navbar" >
            <Login handleForm = { handleLoginForm }/>
            <div className="logo_container"><Link to = "/" className = 'logo' > < img src = {navbarElements.logo} alt = "" /></Link>BestWork</div>
            <SearchBar/>
            <ul className = "link_container">
                {
                    navbarElements.links.map((element)=>{
                        return <li> <Link to = {element.link} className = "link"> {element.title} </Link></li>
                    })
                }
            <li>
            <Tooltip title = "Still not loggin?" >
                <div className = "login_btn" onClick = { handleLoginForm } > Sign In </div> 
            </Tooltip > 
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
    return (
        <div className="searchBar">
            <SearchIcon/>
            <input type="text" placeholder="Looking for a business?" />
        </div>
        
    )
}