import React from 'react'
import './css/Home.css'
import './css/PageStyle.css'
import Grid from '@mui/material/Grid';
import DoubleArrowIcon from '@mui/icons-material/DoubleArrow';
const Home = () => {
    return (
        <div className="home_container">
            <HeroSection/>
            <HomeSection1/>
        </div>
    )
}

export default Home
 
export const HeroSection = () =>{
    return (
        <Grid container className="hero_section page">
                <div className="bubble"></div>
                <div className="bubble"></div>
                <div className="bubble"></div>
                <div className="fade"></div>
                <Grid item xs={12} md={4} className="hero">
                    <span className="title">Your Decision<br/> <span style={{"marginLeft":"20%"}}> Your Future</span></span>
                    <span className="description">Unify your team, data and software as one.</span>
                    <button className="get_started_btn">Get Started<DoubleArrowIcon/></button>
                </Grid>
                <Grid item xs={12} md={8} className="img">
                    <img src="./images/home_bg4.jpg" alt="" />
                    <img src="./images/home_bg2.jpg" alt="" />
                    <img src="./images/home_bg1.jpg" alt="" />
                </Grid>
        </Grid>
    )
}

export const HomeSection1 = () => {
    return (
        <Grid container className="section1_container">
            <div className="fade"></div>
            <Grid item xs={12} md={5} className="info">
                <div className="title">Who are we?</div>
                <iframe src="https://www.youtube.com/embed/pWOv9xcoMeY?autoplay=1&mute=1&loop=1" className="vid" ></iframe>
            </Grid>
            <Grid item xs={12} md={7} >
            <div className="description">
                <span>
                The “My Dollar Shave Club” video is one of the most discussed marketing videos in the past decade. It appeared in most of the top ad charts since it first launched and by now has nearly 27 million views on YouTube. The buzz this video made impacted sales immediately, and still does to this day.
                This video worked not only for its creative spirit but also for the direct, clear, and simple promise it makes.
                If you too can come up with a company intro idea that perfectly matches the identity of your brand, then chances are your company and product can achieve sales success too.
                <br /><br/>
                The “My Dollar Shave Club” video is one of the most discussed marketing videos in the past decade. It appeared in most of the top ad charts since it first launched and by now has nearly 27 million views on YouTube. The buzz this video made impacted sales immediately, and still does to this day.
                </span>
                </div>
            </Grid>
        </Grid>
    )
}