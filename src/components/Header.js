import './Header.css'

const Header = (props) => {
    return (
        <div className="navbar">
            <div className="logo"><img src="images/logo_3svg.svg" alt="" /></div>
            <ul>
                <li><a href="">Menu</a></li>
                <li><a href="">Job</a></li>
                <li><a href="">Contact</a></li>
                <li><a href="">About Us</a></li>
                <li><a href="">Email</a></li>
            </ul>
        </div>      
    )
}

export default Header
