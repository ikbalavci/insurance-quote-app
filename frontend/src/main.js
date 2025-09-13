import { createApp } from 'vue'
// import axios from "axios";
import App from './App.vue'
import router from './router'

import VueSweetalert2 from 'vue-sweetalert2';
// import axios from 'axios';

import 'sweetalert2/dist/sweetalert2.min.css';

import 'bootstrap/dist/css/bootstrap.min.css'

import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import './assets/style.css'


// app.config.globalProperties.$axios = axios;

// const axiosInstance = axios.create({
//   baseURL: "https://jsonplaceholder.typicode.com/"
// });

// Vue.prototype.$axios = axiosInstance;

const app = createApp(App)

app.use(VueSweetalert2);
app.use(router);
app.mount('#app');


