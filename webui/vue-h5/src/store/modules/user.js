import { getInfo, setInfo } from '@/utils/storage'

export default {
  namespaced: true,
  state() {
    return {
      //个人权证相关
      userInfo: getInfo()
    }
  },
  mutations: {
    //所有mutations的第一个参数都是state
    setUserInfo(state, obj) {
      console.log('==========个人用户信息1111111111=====',obj)
      state.userInfo = obj
      setInfo(obj)
    }
  },
  actions: {
    logout(context) {
      //个人信息要重置
      context.commit('setUserInfo', {})
      //购物车信息要重置
      context.commit('cart/setCartList', [], { root: true })
    }
  },
  getters: {}
}