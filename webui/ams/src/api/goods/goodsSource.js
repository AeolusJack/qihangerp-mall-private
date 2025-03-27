import request from '@/utils/request'

// 查询列表
export function listGoodsSource(query) {
  return request({
    url: '/api/ams-api/goodsSource/list',
    method: 'get',
    params: query
  })
}

export function updateGoodsSourceStatus(data) {
  return request({
    url: '/api/ams-api/goodsSource/audit',
    method: 'post',
    data: data
  })
}


