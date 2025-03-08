import request from '@/utils/request'

// 备货清单
export function listShipStockup(query) {
  return request({
    url: '/api/oms-api/ship/stock_up_list',
    method: 'get',
    params: query
  })
}
// 备货完成
export function shipStockupComplete(data) {
  return request({
    url: '/api/oms-api/ship/stock_up_complete',
    method: 'post',
    data: data
  })
}
// 备货完成by order
export function shipStockupCompleteByOrder(data) {
  return request({
    url: '/api/oms-api/ship/stock_up_complete_by_order',
    method: 'post',
    data: data
  })
}

// 推送店铺订单发货
export function pushShopOrderSend(data) {
  return request({
    url: '/api/oms-api/ship/pushShopOrderSend',
    method: 'post',
    data: data
  })
}
