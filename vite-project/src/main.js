import { createApp } from 'vue'
import App from './App.vue'
import './assets/styles.less' // import LESS file
import { createRouter, createWebHistory } from 'vue-router';

// Import your components
import Home from './components/Home.vue';
import Profile from './components/Profile.vue';
import Login from './components/Login.vue';
import ProductListing from './components/ProductListing.vue';
import PostItem from './components/PostItem.vue';

console.log("in router.js");
const routes = [
  { path: "/", name: "Home", component: Home },
  { path: "/profile", component: Profile },
  { path: '/login', name: "Login", component: Login },
  { path: '/productlisting', name: "ProductListing", component: ProductListing },
  { path: '/postitem', name: "PostItem", component: PostItem }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

createApp(App)
  .use(router)
  .mount('#app')
