// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import iView from 'iview';
import VueHighlightJS from 'vue-highlightjs'
import 'highlight.js/styles/default.css';
import 'iview/dist/styles/iview.css';


Vue.config.productionTip = false;
Vue.config.devtools = true;
Vue.use(VueHighlightJS);
Vue.use(iView);


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
});
