import {
  BrowserRouter as Router,
  Routes,
  Route,
} from "react-router-dom";
import Home from './components/Home'
import Navbar from './components/Navbar'
import Footer from './components/Footer'
import "./reset.css"
function App() {
  return (
    <div className="App">
      <Router>
        <div className="space" style={{"width":"100%","height":"50px"}}></div>
        <Navbar/>
        <Routes>
            <Route path="/"  element={<Home/>}/>
            {/* <Route path="/sign-in" element={<Login/>}/> */}
        </Routes>
        <Footer/>
      </Router>
      
    </div>
  );
}
export default App;