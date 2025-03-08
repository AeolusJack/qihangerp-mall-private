import request from '@/utils/request'


// 接口拉取淘宝
export function pullLogisticsTao(data) {
  return request({
    url: '/api/open-api/tao/shopApi/pull_logistics_companies',
    method: 'post',
    data: data
  })
}
export function pullLogisticsJd(data) {
  return request({
    url: '/api/open-api/jd/shopApi/pull_logistics_companies',
    method: 'post',
    data: data
  })
}
export function getTaoOAuthUrl(query) {
  return request({
    url: '/api/open-api/tao/oauth',
    method: 'get',
    params: query
  })
}
export function saveSessionKey(data) {
  return request({
    url: '/api/open-api/tao/saveSessionKey',
    method: 'post',
    data: data
  })
}
