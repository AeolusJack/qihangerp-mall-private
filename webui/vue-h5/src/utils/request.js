import store from '@/store';
import axios from 'axios'
import { Toast } from 'vant'
//创建axios实例 对创建出来的实例进行自定义
const instance = axios.create({
  baseURL: '/dev-api',
  timeout: 5000,
  headers: { platform: 'H5' }
});


//自定义配置 - 请求- 响应拦截器
// 添加请求拦截器
instance.interceptors.request.use(function (config) {
  //在发送请求之前做些什么
  //开启loading 禁止背景点击
  Toast.loading({
    message: '加载中...',
    forbidClick: true,
    loadingType: 'spinner', //配置loading图标
    duration: 0 //不会自动消失
  })

  //只要有token 就在请求时携带 便于请求需要授权的接口
  const token = store.getters.token
  console.log('=========token=========',token)
  if (token) {
    config.headers['Authorization'] = token
    config.headers.platform = 'H5'
  }

  return config;
}, function (error) {
  // 对请求错误做些什么
  return Promise.reject(error);
});

// 添加响应拦截器
instance.interceptors.response.use(function (response) {
  // 2xx 范围内的状态码都会触发该函数。
  // 对响应数据做点什么
  // const res = response.data
  const res = response.data
  console.log('====响应拦截====',response.data)
  if (res.code !== 200) {
    if(res.code===401){
      Toast.fail('身份验证失败，请重新登录');
      location.href = '/#/login';
    }else{
      // Toast默认是单例模式 后面Toast调用了 会将前一个覆盖
      //同时只能存在一个Toast
      Toast(res.msg)
      //抛出一个错误的Promise
      return Promise.reject(res.msg)
    }
  } else {
    //正确 清除loading效果
    Toast.clear()
  }
  return res;
}, function (error) {
  // 超出 2xx 范围的状态码都会触发该函数。
  if (error.response && error.response.status === 401) {
    // 如果是401错误，跳转到登录页面
    Toast.clear();
    Toast.fail('身份验证失败，请重新登录');
    console.log('=====发现token过期=========',error.response)
    // 跳转到登录页，假设你的登录页面路径是 '/login'
    // this.$router.push('/login');
    location.href = '/#/login';
    // return Promise.reject({code:1401,msg:'过期'})
  }
  // 对响应错误做点什么
  return Promise.reject(error);
});

//导出配置好的实例
export default instance