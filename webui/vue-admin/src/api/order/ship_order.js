import request from '@/utils/request'

// 查询店铺订单列表
export function listOrder(query) {
  return request({
    url: '/api/oms-api/ship/order/list',
    method: 'get',
    params: query
  })
}

// 查询店铺订单详细
export function getOrder(id) {
  return request({
    url: '/api/oms-api/ship/order/' + id,
    method: 'get'
  })
}

// 订单明细list
export function listOrderItem(query) {
  return request({
    url: '/api/oms-api/ship/order/item_list',
    method: 'get',
    params: query
  })
}


