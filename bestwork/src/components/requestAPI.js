import axios from 'axios';
import { useState } from 'react';

axios.get('https://bestwork-server.herokuapp.com/get/interest',{

}).then((response) => {
    console.log(response)
})
// apply job candidate
axios.post('http://localhost:3001/candidate/apply',{
    //recruiter-job-id:
},
{
    withCredentials: true
}).then((res)=>{})  
//show job applied candidate
axios.get('http://localhost:3001/candidate/job-applied',
{
    withCredentials: true
}).then((res)=>{})

//job-description
axios.get('http://localhost:3001/candidate/job-description/:jobId',
{
    withCredentials: true
}).then((res)=>{})

// profile recruiter
axios.get('http://localhost:3001/recruiter/profile',
{
    withCredentials: true
}).then((res)=>{})

// edit profile recr
axios.put('http://localhost:3001/recruiter/profile',{
    // recruiter-name:
    // district:
    // city:
    // tax:
},
{
    withCredentials: true
}).then((res)=>{})

//create job 
axios.post('http://localhost:3001/recruiter/job-create',{
    // job-name:
    // salary:
    // start-date:
    // end-date:
    // district:
    // city:
    // working-form:
    // recruitment_quantity:
    // remote:
    // years-of-experience:
    // type-id:
    // skill-id:
    // skill-id:
    // skill-id:
},
{
    withCredentials: true
}).then((res)=>{})

// job published

axios.get('http://localhost:3001/recruiter/job-list',
{
    withCredentials: true
}).then((res)=>{})

//candidate applied
axios.get('http://localhost:3001/recruiter/applied-list/:jobId',
{
    withCredentials: true
}).then((res)=>{})

// info candi applied
axios.get('http://localhost:3001/recruiter/candidate-profile/:candidateId',
{
    withCredentials: true
}).then((res)=>{})

//description job
axios.get('http://localhost:3001/recruiter/job-description/:jobId',
{
withCredentials: true
}).then((res)=>{})

//edit job
axios.put('http://localhost:3001/recruiter/job-description/:jobId',{

},
{
withCredentials: true
}).then((res)=>{})


/*-------------*/

//get interest
axios.get('http://localhost:3001/get/interest',{
    withCredentials: true
}).then((res)=>{})

// get skill
axios.get('http://localhost:3001/get/skill',{
    withCredentials: true
}).then((res)=>{})
// get job name
axios.get('http://localhost:3001/get/job',{
withCredentials: true
}).then((res)=>{})