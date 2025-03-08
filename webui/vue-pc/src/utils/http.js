// axios基础的封装
import axios from 'axios'
import { ElMessage } from 'element-plus'
import { useUserStore } from '@/stores/userStore'
import router from '@/router'

const httpInstance = axios.create({
    // baseURL: 'http://pcapi-xiaotuxian-front-devtest.itheima.net',
    baseURL: '/dev-api',
    timeout: 10000
})

// 拦截器

// axios请求拦截器
httpInstance.interceptors.request.use(
  (config) => {
    // 从pinia获取token数据
    const useStore = useUserStore()
    // 按照后端的要求拼接token数据
    const token = useStore.userInfo.token
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (e) => Promise.reject(e)
)

// axios响应式拦截器
httpInstance.interceptors.response.use(
  (res) => res.data,
  (e) => {
    const useStore = useUserStore()
    // 统一错误提示
    ElMessage({
      type: 'warning',
      message: e.response.data.message
    })
    // 401token失效处理
    // 1.清除本地数据
    // 2.跳转到登录页
    if (e.response.status === 401) {
      useStore.clearUserInfo()
      router.push('/login')
    }
    return Promise.reject(e)
  }
)

export default httpInstance
