import request from '@/utils/request'

// 查询
export function listDaily(query) {
  return request({
    url: '/api/oms-api/goodsSale/report',
    method: 'get',
    params: query
  })
}


export function listRegionDaily(query) {
  return request({
    url: '/api/oms-api/goodsSale/regionReport',
    method: 'get',
    params: query
  })
}
