import request from '@/utils/request'

export function publishGoodsSource(data) {
  return request({
    url: '/api/mall-api/goodsSource/publish',
    method: 'post',
    data: data,
  })
}