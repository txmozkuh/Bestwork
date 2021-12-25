import React from 'react'
import {useParams} from 'react-router-dom'
import './css/Detail.css'
import Grid from '@mui/material/Grid';
import AttachMoneyIcon from '@mui/icons-material/AttachMoney';
import AvTimerIcon from '@mui/icons-material/AvTimer';
import MilitaryTechIcon from '@mui/icons-material/MilitaryTech';
import SendIcon from '@mui/icons-material/Send';
const JobDetail = () => {
    const {id} = useParams();
    return (
        <div className='detail_container'>
            <Grid container>
                <Grid item xs={12} md={6} lg={4}  >
                    <div className="comp_info">
                        <div className="ava"><img src="https://images.unsplash.com/photo-1590874315261-788881621f7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80" alt="" /></div>
                        <div className="name">Company name here</div>
                        <div className="address">Address here</div>
                        <div className="contact">Contact here</div>
                    </div>
                </Grid>
                <Grid item xs={12} md={6} lg={8}>
                    <div className="job_info">
                            <div className="basic_info">
                                <div className="name">Job name here</div>
                                <div className="salary">Salary: $500 - 100$</div>
                                <div className="address">Address: 880-888 Vincom Tower Nguyen Hue District 1 TPHCM</div>
                            </div>
                            <div className="time_info">
                            <div className="outdated_time">Valid from: 12/12/2021 till 30/12/2021</div>
                        </div>
                        <div className="description">
                            <h1>Description</h1>
                            <p>
                                What You Will Do<br/>
                                With our continued expansion, we seek to bring on board additional qualified VIETNAMESE TEACHERS OF ENGLISH. Join us now!<br/>
                                 <br/>
                                WHY WORK AT VUS?<br/>
                                 <br/>
                                Becoming part of VUS teaching staff, you will have the opportunity to<br/>
                                • Work for an established and reputable ELT institution which is the largest employer of ELT teachers in Vietnam (more than 2,200 teaching staff)<br/>
                                • Receive ongoing professional development &amp; support (annual TESOL conferences, workshops, mentoring, continued academic support, etc.)<br/>
                                • Earn a competitive hourly rate of pay and benefit package, and additional supplements for exam preparation &amp; corporate classes<br/>
                                • Enjoy full-time contract completion bonus &amp; full health insurance policy<br/>
                                • Win annual awards for recognition of outstanding teaching performance (gala dinners, gift vouchers, teacher away days to top resorts, etc.)   
                            </p>
                        </div>
                        <div className="requirements">
                            <h1>Requirements</h1>
                            <p>
                            To be eligible for a teaching position at VUS, applicants must have<br/>
                            • BA in TESOL; OR<br/>
                            • BA in English with a teaching certificate (CELTA, TESOL, TEFL, TKT…)<br/>
                            • Weekday evening and weekend availability<br/>
                            <br/>
                            HOW TO APPLY?<br/>
                            Application documents must be in English and include the following:<br/>
                            • A cover letter with a recent passport-size photo<br/>
                            • An updated CV<br/>
                            • A copy of ID card<br/>
                            • Copies of degree(s) &amp; teaching certificate<br/>
                            <br/>
                            Interested applicants are welcome to apply via our recruitment microsite https://teachenglish.vus.edu.vn/ or hand in their application package at VUS head office:<br/>
                            <br/>
                            Human Resources (Teachers) Department<br/>
                            Vietnam USA Society English Centers – Head Office<br/>
                            9th floor, 189 Nguyen Thi Minh Khai Street,<br/>
                            District 1, Ho Chi Minh City, Vietnam
                            </p> 
                        </div>
                        <div className="benefit">
                            <h1>Benefit</h1>
                            <div className="salary b_box">
                                <AttachMoneyIcon/>
                                Price Bonus  
                            </div>
                            <div className="time b_box">
                                <AvTimerIcon/>
                                Working time benefit
                            </div>
                            <div className="award b_box">
                                <MilitaryTechIcon/>
                                Achievement and bonus
                            </div>
                            
                            
                        </div>
                        
                    </div>
                    
                    <div className="send_cv_btn">
                        Send CV &nbsp;&nbsp; <SendIcon/>
                    </div>
                </Grid>
                
            </Grid>
        </div>
    )
}

export default JobDetail
