import axios from 'axios'
const apiDomain = 'http://localhost:3000/api/'

const Axios = axios.create({
  baseURL: apiDomain,
  headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=utf-8'
  }
});

export default Axios;
