import request from '@/utils/request'

export function publishGoodsSource(data) {
  return request({
    url: '/api/mall-api/goodsSource/publish',
    method: 'post',
    data: data,
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

