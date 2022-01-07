import React from 'react'
import './css/Profile.css'
import axios from 'axios'
import CircularProgress from '@mui/material/CircularProgress';
import { useNavigate } from 'react-router-dom';
import EditJob from './EditJob';
import { useParams } from 'react-router-dom';
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
            console.log(res.data.list)
            SetListCandidate(res.data.list)
        })
    },[])
    return (
        <div>
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
                            Object.keys(listCandidate).length === 0?
                            <div className='profile_container'><CircularProgress style={{"color":"rgb(238,125,52)"}}/></div>
                            :
                            <>
                            {
                                // listCandidate.map(candidate=>{
                                //     return <tr>
                                //         <th style={{"cursor":"pointer"}} onClick={()=>{

                                //         }}>{candidate.Candidate_Name}</th>
                                //         <th>{candidate.Apply_Time.split('T')[0]}</th>
                                //         <th>{candidate.Phone_Number}</th>
                                //         <th>{candidate.Email}</th>
                                //     </tr>
                                // })
                                console.log(listCandidate)
                            }
                                
                            </>
                            
                        }
                </tbody>
            </table>
        </div>
    )
}

export default ListCandidateAppliedTable