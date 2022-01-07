import React from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
} from "react-router-dom";
import "./reset.css"
import Navbar from './components/Navbar'
import Footer from './components/Footer'
import Home from './components/Home'
import JobList from "./components/JobList";
import JobDetail from "./components/JobDetail";
import Login from "./components/Login";
import SignUp from "./components/SignUp";
import Profile from "./components/Profile";
import CreateJobForm from "./components/CreateJobForm";
import ArrowUpwardIcon from '@mui/icons-material/ArrowUpward';
import EditJob from "./components/EditJob"
import ListCandidateAppliedTable from './components/ListCandidateAppliedTable'
import UpdateFormRecruiter from './components/FormUpdateRecruiterInfo'
import UpdateFormCandidate from './components/FormUpdateCandidateInfo'

function App() {
  React.useEffect(()=>{
    window.scrollTo(0,0)
  },[])
  const ScrollToTop=()=>{
    window.scrollTo({top:0,left:0,behavior:'smooth'})
  }
  window.onscroll=()=>{
    if(window.pageYOffset === 0){
      document.querySelector('.scroll_top_btn').style.display="none"
    }
    else{
      document.querySelector('.scroll_top_btn').style.display="flex"
    }
  }

  return (
    <div className="App">
      <div className="scroll_top_btn" onClick={ScrollToTop}><ArrowUpwardIcon/></div>
      <Router>
        <div className="space" style={{"width":"100%","height":"50px"}}></div>
        <Navbar/>
        <Routes>
            <Route path="/" exact element={<Home/>}/>
            <Route path="/job/:searchValue" element={<JobList/>}/>
            <Route path="/job" element={<JobList/>}/>
            <Route path="/job/item/:id" element={<JobDetail/>}/>   
            <Route path="/sign-in" element={<Login/>}/>   
            <Route path="/sign-up" element={<SignUp/>}/>   
            <Route path="/profile" element={<Profile/>}/>   
            <Route path="/job-add" element={<CreateJobForm/>}/>
            <Route path="/job-edit/:id" element={<EditJob/>}/>  
            <Route path="/job-candidate/:id" element={<ListCandidateAppliedTable/>}/>  
            <Route path="/update/candidate" element={<UpdateFormCandidate/>}/>
            <Route path="/update/candidate" element={<UpdateFormRecruiter/>}/>
            
             
        </Routes>
        <Footer/> 
      </Router>
      
    </div>
  );
}
export default App;