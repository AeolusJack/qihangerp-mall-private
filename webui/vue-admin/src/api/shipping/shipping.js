import request from '@/utils/request'



// 分配给供应商发货
export function distributeSupplierShip(data) {
  return request({
    url: '/api/oms-api/shipping/supplier_ship_dist',
    method: 'post',
    data: data
  })
}
