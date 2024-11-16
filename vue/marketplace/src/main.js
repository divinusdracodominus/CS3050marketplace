import { createApp } from 'vue';
import App from './App.vue';

// Import global styles
import './assets/styles.less';

// Import a UI library (e.g., Element Plus)
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';

// Optional: Import Router and Store if used
// import router from './router';
// import store from './store';

const app = createApp(App);

// Use UI library
app.use(ElementPlus);

// Optional: Use router and store
// app.use(router);
// app.use(store);

// Mount the app
app.mount('#app');
