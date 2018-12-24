import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/views/index'
import Datas from '@/views/datas'
import About from '@/views/about'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Index',
      component: Index
    },
    {
      path: '/datas',
      name: 'Datas',
      component: Datas
    },
    {
      path: '/about',
      name: 'About',
      component: About
    }
  ]
})
