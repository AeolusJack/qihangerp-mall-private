import { changeCount, delSelect, getCartList } from "@/api/cart"
import { Toast } from "vant"

export default {
  namespaced: true,
  state() {
    return {
      cartList: []
    }
  },
  mutations: {
    setCartList(state, newList) {
      state.cartList = newList
    },
    toggleCheck(state, goodsId) {
      //让对应id的项的状态取反
      const goods = state.cartList.find(item => item.goods_id === goodsId)
      goods.isChecked = !goods.isChecked
    },
    toggleAllCheck(state, flag) {
      //让所有的单选框 重置
      state.cartList.forEach(item => {
        item.isChecked = flag
      })
    },
    changeCount(state, { goodsId, goodsNum }) {
      const goods = state.cartList.find(item => item.goods_id === goodsId)
      goods.goods_num = goodsNum
    }
  },
  actions: {
    async getCartAction(context) {
      const { data } = await getCartList()
      //后台返回的数据中不包含复选框的选中状态
      //需要手动维护数据 给每项 添加isChecked状态
      data.list.forEach(item => {
        item.isChecked = true
      })
      context.commit('setCartList', data.list)
    },
    async changeCountAction(context, obj) {
      const { goodsNum, goodsId, goodsSkuId } = obj
      // 先本地修改
      context.commit('changeCount', { goodsId, goodsNum })
      // 再同步到后台
      const res = await changeCount(goodsId, goodsNum, goodsSkuId)
    },
    //删除购物车数据
    async delSelect(context) {
      const selCartList = context.getters.selCartList
      const cartIds = selCartList.map(item => item.id)
      await delSelect(cartIds)
      Toast('删除成功')

      //重新获取最新的购物车数据
      context.dispatch('getCartAction')
    }
  },
  getters: {
    //求所有商品的累加总数
    cartTotal(state) {
      return state.cartList.reduce((sum, item) => sum + item.goods_num, 0)
    },
    //选中的商品项
    selCartList(state) {
      return state.cartList.filter(item => item.isChecked)
    },
    // 选中的总数
    selCount(state, getters) {
      return getters.selCartList.reduce((sum, item) => sum + item.goods_num, 0)
    },
    // 选中的总价
    selPrice(state, getters) {
      return getters.selCartList.reduce((sum, item) => {
        return sum + item.goods_num * item.goods.goods_price_min
      }, 0).toFixed(2)
    },
    //是否全选
    isAllChecked(state) {
      return state.cartList.every(item => item.isChecked)
    }
  }
}