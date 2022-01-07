import './css/Profile.css'
import UpdateFormRecruiter from './FormUpdateRecruiterInfo'
import React, { useEffect } from 'react'
import axios from 'axios'
import RecruiterJobList from './RecruiterJobList'
import CircularProgress from '@mui/material/CircularProgress';
import { useNavigate } from 'react-router-dom';
export const StarCV = (props) =>{
    const navigate = useNavigate();
    const [update,setUpdate] = React.useState(false)
    const [listCandidate, setListCandidate] = React.useState([])
    useEffect(() => {
        axios.get('http://localhost:3001/recruiter/star-cv',
        {
            withCredentials: true
        }).then((res)=>{
            setListCandidate(res.data.candidates)
        })
    },[])
    return (
        <div className='profile_container'>
            {
                Object.keys(listCandidate).length === 0?
                <div className='profile_container'><CircularProgress style={{"color":"rgb(238,125,52)"}}/>Loading</div>
                :
                <div>
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>Candidate name</th>
                                <th>Email</th>
                                <th>Working Type</th>
                                <th>Skill</th>
                            </tr>
                        </thead>
                        <tbody>
                                {
                                    listCandidate.map(candidate=>{
                                        return <tr>
                                            <th style={{"cursor":"pointer"}} onClick={()=>{
                                                navigate(`/candidate/item/${candidate.Candidate_ID}`);
                                            }}>
                                                {candidate.Candidate_Name}
                                            </th>
                                            <th>{candidate.Email}</th>
                                            <th>{candidate.Job_Name}</th>
                                            {
                                                candidate.skill.map(item=>{
                                                    return <div>
                                                        {
                                                            item.Skill_Name
                                                        }
                                                    </div>
                                                })
                                            }
                                        </tr>
                                    })
                                }
                        </tbody>
                    </table>
                </div>
         
            }
        </div>
    )
}
export default StarCV