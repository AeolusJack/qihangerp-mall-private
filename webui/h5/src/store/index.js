import Vue from 'vue'
import Vuex from 'vuex'
import user from './modules/user'
import cart from './modules/cart'

Vue.use(Vuex)

export default new Vuex.Store({
  getters: {
    token(state) {
      console.log('=====获取到的用户token====444444444444444======',state.user.userInfo.token)
      return state.user.userInfo.token
    }
  },

  modules: {
    user,
    cart
  }
})
