import request from '@/utils/request'

export function publishGoodsSource(data) {
  return request({
    url: '/api/mall-api/goodsSource/publish',
    method: 'post',
    data: data,
  })
}

export function getGoodsSource(id) {
  return request({
    url: '/api/mall-api/goodsSource/'+id,
    method: 'get',
  })
}

export function listPendingGoodsSource(param) {
  return request({
    url: '/api/mall-api/goodsSource/pendingSourceList',
    method: 'get',
    params: param,
  })
}
export function acceptSourceOrder(data) {
  return request({
    url: '/api/mall-api/goodsSource/acceptSourceOrder',
    method: 'post',
    data: data,
  })
}

// 订单列表
export const getMySourceOrderList = (dataType, page) => {
  return request.get('/api/mall-api/goodsSource/order/list', {
    params: {
      dataType,
      page
    }
  })
}