import request from '@/utils/request'

export function getModelList() {
  return request({
    url: '/api/ams-api/goods/model/list',
    method: 'get',
  })
}
