import Vue from 'vue'
import VueRouter from 'vue-router'

import Layout from '@/views/layout'
import Home from '@/views/layout/home.vue'
import Category from '@/views/layout/category.vue'
import Cart from '@/views/layout/cart.vue'
import User from '@/views/layout/user.vue'

import store from '@/store'

const Login = () => import('@/views/login')
const Search = () => import('@/views/search')
const SearchList = () => import('@/views/search/list')
const ProDetail = () => import('@/views/prodetail')
const Pay = () => import('@/views/pay')
const MyOrder = () => import('@/views/myorder')


Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {
      path: '/',
      component: Layout,
      redirect: '/home',
      children: [
        { path: '/home', component: Home },
        { path: '/category', component: Category },
        { path: '/cart', component: Cart },
        // { path: '/source', component: GoodsSourceOrder },
        { path: '/user', component: User },
      ]
    },
    { path: '/login', component: Login },
    { path: '/search', component: Search },
    { path: '/searchlist', component: SearchList },
    //动态路由传参
    { path: '/prodetail/:id', component: ProDetail },
    { path: '/pay', component: Pay },
    { path: '/myorder', component: MyOrder },
  ]
})

//全局前置导航守卫
//to:到哪里去（路径，参数）
//from:从哪里来（路径，参数）
//next:是否放行

//定义数组 专门用户存放所有需要权限访问的页面
const authUrls = ['/pay', '/myorder']
router.beforeEach((to, from, next) => {
  // console.log(to, from, next);
  // 看to.path是否在authUrls中出现过
  //非权限页面直接放行
  if (!authUrls.includes(to.path)) {
    next()
    return
  }
  //是权限页面 需要判断token
  const token = store.getters.token
  if (token) {
    next()
  } else {
    next('/login')
  }
})

export default router
