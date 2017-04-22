import Vue from 'vue';
import App from './App';
import router from './router';
import axios from 'axios';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-default/index.css';    // 默认主题
// import '../static/css/theme-green/index.css';       // 浅绿色主题
import "babel-polyfill";
import './mock/index.js';
Vue.use(ElementUI);

router.beforeEach((to, from, next) => {
	if (!localStorage.getItem('ms_username') && to.query.isLoginPage !== 'true') {
		next({ path: '/login', query: { isLoginPage: 'true' } })
	}else{
		next();
	}
})

Vue.prototype.$axios = axios;
new Vue({
    router,
    render: h => h(App)
}).$mount('#app');

