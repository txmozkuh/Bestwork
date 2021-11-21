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
            <HomeSection2/>
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

                <Grid item xs={12} md={5} className="hero">
                    <div className="title">
                    <span className="title1">YOUR </span>
                    <span className="title2">FUTURE DECISION</span>
                    </div>
                    <span className="description">Unify your team, data and software as one.</span>
                    <button className="get_started_btn">Get Started<DoubleArrowIcon/></button>
                </Grid>
                <Grid item xs={12} md={7} className="img">
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
            <Grid item xs={12} md={6} className="info">
                <iframe src="https://www.youtube.com/embed/pWOv9xcoMeY?autoplay=1&mute=1&loop=1" className="vid" ></iframe>
            </Grid>
            <Grid item xs={12} md={6} className="definition" >
                <div className="title">ABOUT COMPANY</div>
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
            <div class="curve">
                <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                    <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
                    <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
                    <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
                </svg>
            </div>
        </Grid>
    )
}

export const HomeSection2 = () => {
    const collaborators=[
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        },
        {
            name:"Google",
            logo:"gg.png"
        }
    ]
    return (
        <div className="section2_container">
            <div className="title">COLLABORATOR</div>
            <Grid container className="collab_list">
                {
                    collaborators.map((colab)=>{
                        return <Grid className="collab_item" item xs={6} md={3}><img src={`./images/${colab.logo}`} alt="" /></Grid>
                    })
                }
            </Grid>
        </div>
    )
}