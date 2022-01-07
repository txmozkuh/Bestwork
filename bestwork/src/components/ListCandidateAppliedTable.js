import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import CircularProgress from '@mui/material/CircularProgress';
import { useNavigate } from 'react-router-dom';
import EditJob from './EditJob';
import { useParams } from 'react-router-dom';
import Snackbar from '@mui/material/Snackbar';
import MuiAlert from '@mui/material/Alert';
const ListCandidateAppliedTable = ({jobList}) => {
    const navigate = useNavigate();
    const {id} = useParams()
    console.log(id)
    const [listCandidate,SetListCandidate] = React.useState([])
    React.useEffect(()=>{
        axios.get(`http://localhost:3001/recruiter/applied-list/${id}`,
        {
        withCredentials: true
        }).then((res)=>{
            console.log(res)
            SetListCandidate(res.data.list)
        })
    },[])
    const [open, setOpen] = React.useState(false);
    const [submit, setSubmit] = React.useState(false)
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
    const handleProfile = () => {
        setSubmit(true)
        handleClick()
        setSubmit(false)
        setTimeout(() => {
            window.location.href="/profile"
        }, 1000); 
        
    }
    return (
        <div className='profile_container'>
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Candidate name</th>
                        <th>Apply time</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                        {
                            listCandidate.length===0?
                            <tr>No result</tr>
                            :
                            <>
                            {
                                listCandidate.map(candidate=>{
                                    return <tr>
                                        <th>{candidate.Candidate_Name}</th>
                                        <th>{candidate.Apply_Time.split('T')[0]}</th>
                                        <th>{candidate.Phone_Number}</th>
                                        <th>{candidate.Email}</th>
                                    </tr>
                                })
                            }
                            </>
                            
                            
                        }
                </tbody>
            </table>
            <div className="button"  onClick={handleProfile}>
                {
                    submit?
                    <CircularProgress style={{"color":"white"}}/>
                    :
                    <>Back to profile</>
                }
            </div>
        </div>
    )
}

export default ListCandidateAppliedTable