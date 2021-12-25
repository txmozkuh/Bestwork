import axios from 'axios';
import { useState } from 'react';

axios.get('https://bestwork-server.herokuapp.com/get/interest',{

}).then((response) => {
    console.log(response)
})