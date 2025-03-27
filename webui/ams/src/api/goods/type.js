import request from '@/utils/request'

export function getTypeList() {
  return request({
    url: '/api/ams-api/goods/type/list',
    method: 'get',
  })
}
