import request from '@/utils/request'

// 查询商品管理列表
export function listUser(query) {
  return request({
    url: '/api/ams-api/user/list',
    method: 'get',
    params: query
  })
}
