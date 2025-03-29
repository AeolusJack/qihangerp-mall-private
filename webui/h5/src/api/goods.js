import request from '@/utils/request'

export function publishGoods(data) {
  return request({
    url: '/api/mall-api/goods/publish',
    method: 'post',
    data: data,
  })
}

export function listGoods(param) {
  return request({
    url: '/api/mall-api/goods/list',
    method: 'get',
    params: param,
  })
}