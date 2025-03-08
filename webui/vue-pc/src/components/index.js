// 把components中的所有组件都进行全局化注册

import ImageView from './ImageView/index.vue'
import Sku from './WudSku/index.vue'
export const componentPlugin = {
  install: (app) => {
    // app.component('组件名字','组件配置对象')
    app.component('WudImageView', ImageView)
    app.component('WudSku', Sku)
  }
}
