import request from '@/utils/request'

export function getModelList() {
  return request({
    url: '/api/mall-api/goods/model/list',
    method: 'get',
  })
}

export function getBrandList() {
  return request({
    url: '/api/mall-api/goods/brand/list',
    method: 'get',
  })
}

export function getTypeList() {
  return request({
    url: '/api/mall-api/goods/type/list',
    method: 'get',
  })
}