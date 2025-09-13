import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:5000/api', // ASP.NET Web API adresinize göre güncelleyin
  headers: {
    'Content-Type': 'application/json'
  }
});

export default api;
